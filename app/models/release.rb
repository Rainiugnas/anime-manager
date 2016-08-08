class Release < ActiveRecord::Base
  #Association
  has_many :animes

  #Constants
  def self.quarters() %w(winter spring summer fall) end

  #validates
  validates :quarter, inclusion: { in: Release.quarters }
  validates :quarter, uniqueness: { scope: :year }
  validates :year, presence: true

  #Default value
  ## Set date in function of quarter and year
  after_validation do
    month = Release.quarters.find_index(self.quarter) * 3 + 1

    self.date = Date.new self.year, month, 1
  end

  #Record handler
  default_scope { order date: :desc }

  #Format
  def to_s () "#{quarter.capitalize} #{year.to_s}" end
  ##Use by rails admin to display correct name
  def name () to_s end
end
