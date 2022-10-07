class AddColumnEmailIdToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :email_id, :string
  end
end
