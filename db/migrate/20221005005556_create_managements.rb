class CreateManagements < ActiveRecord::Migration[7.0]
  def change
    create_table :managements do |t|

      t.timestamps
    end
  end
end
