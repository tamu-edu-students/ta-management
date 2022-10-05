class AddNameToManagements < ActiveRecord::Migration[7.0]
  def change
    add_column :managements, :name, :string
  end
end
