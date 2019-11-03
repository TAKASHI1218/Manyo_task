class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :labels, :label, :name
  end
end
