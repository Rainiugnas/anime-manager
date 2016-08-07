class Anime < ActiveRecord::Base
  #Constants
  def self.steps()  %w(To\ check To\ see Saw) end
  def self.states() %w(Waiting To\ dl) end

  #Validations
  validates :title, presence: true
  validates :step, inclusion: { in: Anime.steps }
  validates :state, inclusion: { in: Anime.states }
  validates :release, presence: true
end
