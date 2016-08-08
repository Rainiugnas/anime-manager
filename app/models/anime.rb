class Anime < ActiveRecord::Base
  #Association
  belongs_to :release
  belongs_to :rate

  #Constants
  def self.steps()  %w(To\ check To\ see Saw) end
  def self.states() %w(Waiting To\ dl) end

  #Validations
  validates :title, presence: true
  validates :step, inclusion: { in: Anime.steps }
  validates :state, inclusion: { in: Anime.states }
  validates :release, presence: true
  validates :rate, presence: true

  #Default values
  after_initialize if: :new_record? do
    self.season ||= 1
    self.step ||= Anime.steps.first
    self.state ||= Anime.states.first
  end

  after_validation do
    self.estimate = self.release.date + 1.year if self.estimate.blank?
    self.adala = "http://adala-news.fr/?s=#{self.title.gsub " ", "+"}" if self.adala.blank?
    self.t411 = "http://www.t411.ch/torrents/search/?search=#{self.title.gsub " ", "+"}&order=size&type=desc" if self.t411.blank?
  end

  #Record handler
  scope :to_check, -> { where(step: "To check").order 'LOWER(title) ASC' }
  scope :to_see, -> { where(step: "To see").order(state: :asc, estimate: :asc).order 'LOWER(title) ASC'}
  scope :saw, -> { where(step: "Saw").order 'LOWER(title) ASC' }

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
