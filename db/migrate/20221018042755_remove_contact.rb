class RemoveContact < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :contact
  end
end
