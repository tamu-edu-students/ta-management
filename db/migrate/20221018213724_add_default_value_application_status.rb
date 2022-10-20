class AddDefaultValueApplicationStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :students, :application_status, :string, default: 'applied'
  end
end
