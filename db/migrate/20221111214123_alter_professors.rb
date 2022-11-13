class AlterProfessors < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :professors, :users
    remove_column :professors, :user_id
    add_column :professors, :email_id, :string
  end
end
