class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :course_name
      t.string :course_section
      
      t.timestamps
    end
  end
end
