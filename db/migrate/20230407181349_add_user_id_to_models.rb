class AddUserIdToModels < ActiveRecord::Migration[7.0]
def change
  add_column :students, :user_id, :integer
  add_foreign_key :students, :users

  add_column :professors, :user_id, :integer
  add_foreign_key :professors, :users

end
end
