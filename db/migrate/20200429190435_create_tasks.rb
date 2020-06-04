class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :status
      t.string :item
      t.date :deadline

      t.timestamps
    end
  end
end
