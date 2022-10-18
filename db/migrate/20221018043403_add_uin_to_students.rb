class AddUinToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :uin, :integer
  end
end
