class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email_id
      t.string :contact
      t.boolean :employment_status
      t.boolean :is_undergrad
      t.text :courses_completed, array: true, default: []
      t.binary :resume
      t.binary :transcript
      t.text :access_level, array: true, default: ['applicant']
      t.text :application_status
      t.string :comments
      t.text :assigned_courses, array: true, default: []
      t.text :assigned_sections, array: true, default: []
      t.integer :rating
      t.string :feedback

      t.timestamps
    end
  end
end
