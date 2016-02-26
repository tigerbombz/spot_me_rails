class Tag < ActiveRecord::Base
  has_many :workout_tags
  has_many :workouts, through: :workout_tags
  # validates :name, uniqueness: true
  validates :name, presence: true
end
