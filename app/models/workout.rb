class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_tags
  has_many :tags, through: :workout_tags
  has_many :comments
  validates :title, :presence => true
  validates :bio, :presence => true

end
