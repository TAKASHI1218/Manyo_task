class ChangeStatusPriority < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :status, :string
    remove_column :tasks, :priority, :string
    add_column :tasks, :status, :integer, null:false
    add_column :tasks, :priority, :integer, null:false
  end
end
