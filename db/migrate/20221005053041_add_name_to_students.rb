class AddNameToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :name, :string
    add_column :students, :uin, :integer
  end
end
