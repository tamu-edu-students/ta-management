class AddProfessorEmailToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :professor_email, :string
  end
end
