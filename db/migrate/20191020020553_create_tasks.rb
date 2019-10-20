class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :task_name
      t.string :task_status
      t.string :label
      t.datetime :cut_off_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
