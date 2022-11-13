class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.belongs_to :subject, foreign_key: true
      t.belongs_to :student, foreign_key: true
      t.belongs_to :professor, foreign_key: true
      t.timestamps
    end
  end
end
