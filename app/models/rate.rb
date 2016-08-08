class Rate < ActiveRecord::Base
  #Association
  has_many :animes

  #validates
  validates :name, presence: true, uniqueness: true
  validates :value, presence: true, uniqueness: true

  #Record handler
  default_scope { order value: :desc }

  #Format
  def to_s() name end
end
