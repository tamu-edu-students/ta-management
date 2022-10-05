class CreateProfessors < ActiveRecord::Migration[7.0]
  def change
    create_table :professors do |t|
      t.string :course_list
      t.string :course_section

      t.timestamps
    end
  end
end
