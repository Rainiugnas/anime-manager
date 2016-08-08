class Anime < ActiveRecord::Base
  #Constants
  def self.steps()  %w(To\ check To\ see Saw) end
  def self.states() %w(Waiting To\ dl) end

  #Validations
  validates :title, presence: true
  validates :step, inclusion: { in: Anime.steps }
  validates :state, inclusion: { in: Anime.states }
  validates :release, presence: true

  #Default values
  after_initialize if: :new_record? do
    self.release ||= Date.today
    self.rate ||= 1
    self.season ||= 1
    self.step ||= Anime.steps.first
    self.state ||= Anime.states.first
  end

  after_validation do
    self.estimate = self.release + 1.year if self.estimate.blank?
    self.adala = "http://adala-news.fr/?s=#{self.title.gsub " ", "+"}" if self.adala.blank?
    self.t411 = "http://www.t411.ch/torrents/search/?search=#{self.title.gsub " ", "+"}&order=size&type=desc" if self.t411.blank?
  end

  #Record handler
  scope :to_check, -> { where step: "To check" }
  scope :to_see, -> { where step: "To see" }
  scope :saw, -> { where step: "Saw" }

  #Modifier
  ## Change the current step to the next one
  def next_step!
    return if step == Anime.steps.last

    index = Anime.steps.find_index step
    update(step: Anime.steps[index.next])
  end

  #Policy
  def download?() state == "To dl" end
end
