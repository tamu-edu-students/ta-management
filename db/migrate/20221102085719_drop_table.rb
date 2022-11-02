class DropTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :subject_lists
    drop_table :courses
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
