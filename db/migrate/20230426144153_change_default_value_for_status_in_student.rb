class ChangeDefaultValueForStatusInStudent < ActiveRecord::Migration[7.0]
  def change
    change_column_default :students, :application_status, "not applied"
  end
end
