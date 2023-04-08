class AddDefaultAccessLevelToUsers < ActiveRecord::Migration[7.0]
  def change
   change_column :users, :access_level, :string, default: "TA"
  end
end
