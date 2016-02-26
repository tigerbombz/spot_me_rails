class AddUrlToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :url, :string
  end
end
