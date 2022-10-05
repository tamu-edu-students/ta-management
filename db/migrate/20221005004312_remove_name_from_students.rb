class RemoveNameFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :name, :string
    remove_column :students, :email_id, :string
    remove_column :students, :password, :string
  end
end
