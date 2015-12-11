class ChangeCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :is_open
    add_column :courses, :status, :integer, default: 0
  end
end
