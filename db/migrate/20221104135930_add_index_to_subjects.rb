class AddIndexToSubjects < ActiveRecord::Migration[7.0]
  def change
    add_index :subjects, [:course_name, :course_section], unique: true
  end
end
