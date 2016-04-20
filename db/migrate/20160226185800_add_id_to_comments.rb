class AddIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :workout, index: true, foreign_key: true
  end
end
