class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :cut_off_date, :datetime
    add_column :tasks, :cut_off_date, :string    
  end
end
