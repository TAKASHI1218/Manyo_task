class ChangeColumnInfo2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :cut_off_date, :date
    add_column :tasks, :cut_off_date, :date, null:false

  end
end
