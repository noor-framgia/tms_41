class AddStatusToUserSubjects < ActiveRecord::Migration
  def change
    add_column :user_subjects, :status, :integer, default: 0
  end
end
