class AddParentIdColumnToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :parent, foreign_key: { to_table: :tasks }
  end
end
