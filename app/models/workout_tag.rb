class WorkoutTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :workout
end
