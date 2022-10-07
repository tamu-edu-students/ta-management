class AddIsActiveToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :is_active, :boolean
  end
end
