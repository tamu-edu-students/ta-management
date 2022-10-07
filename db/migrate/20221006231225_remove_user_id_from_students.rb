class RemoveUserIdFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :user_id, :bigint
  end
end
