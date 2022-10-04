class AddContactToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :contact, :string
  end
end
