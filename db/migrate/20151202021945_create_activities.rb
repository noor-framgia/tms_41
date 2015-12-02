class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity_type
      t.references :user, index: true, foreign_key: true
      t.integer :target_id
      t.integer :course_id
      t.integer :subject_id
      t.integer :task_id
      t.string :action_message

      t.timestamps null: false
    end
  end
end
