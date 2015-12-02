class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :user, index: true, foreign_key: true
      t.date :todays_date
      t.text :todays_task
      t.text :tomorrows_task
      t.text :free_comment

      t.timestamps null: false
    end
  end
end
