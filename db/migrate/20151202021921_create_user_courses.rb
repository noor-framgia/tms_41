class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.datetime :deadline
      t.boolean :is_completed

      t.timestamps null: false
    end
  end
end
