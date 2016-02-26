class CreateWorkoutTags < ActiveRecord::Migration
  def change
    create_table :workout_tags do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :workout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
