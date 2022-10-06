class AddUserToManagements < ActiveRecord::Migration[7.0]
  def change
    add_reference :managements, :user, null: false, foreign_key: true
  end
end
