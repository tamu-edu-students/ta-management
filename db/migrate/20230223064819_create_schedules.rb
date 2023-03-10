class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.text :code
      t.integer :course_id
      t.integer :section
      t.text :lecture_day
      t.text :start_time
      t.text :end_time
      t.text :professor
      t.text :students, array: true

      t.timestamps
    end
  end
end