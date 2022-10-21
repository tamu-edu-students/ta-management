class ChangeResumeTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :students, :resume, :string
    change_column :students, :transcript, :string
  end
end
