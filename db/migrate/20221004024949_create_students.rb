class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email_id
      t.string :password
      t.boolean :employment_status, default: false
      t.boolean :is_undergrad
      t.text :courses_completed, array: true, default: []
      t.string :application_status
      t.string :comments
      t.text :assigned_courses, array: true, default: []
      t.text :assigned_sections, array: true, default: []
      t.integer :rating
      t.string :feedback
      t.text :access_level, array: true, default: ['applicant']
      t.blob :resume
      t.blob :transcript
      t.timestamps
    end
  end
end
