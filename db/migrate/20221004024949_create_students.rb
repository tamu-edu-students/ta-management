class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email_id
      t.string :password
      t.boolean :employment_status, default: false
      t.boolean :is_undergrad
      t.text :courses_completed
      t.string :application_status
      t.string :comments
      t.string :assigned_courses
      t.string :assigned_sections
      t.integer :rating, limit: 10
      t.string :feedback
      t.text :access_level, default: '["applicant"]'
      t.blob :resume
      t.blob :transcript
      t.timestamps
    end
  end
end
