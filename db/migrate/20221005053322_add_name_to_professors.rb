class AddNameToProfessors < ActiveRecord::Migration[7.0]
  def change
    add_column :professors, :name, :string
  end
end
