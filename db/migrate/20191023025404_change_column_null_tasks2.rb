class ChangeColumnNullTasks2 < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :content, :string, null:false

  end
end
 
