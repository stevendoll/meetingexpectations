class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :name
      t.text :description
      t.datetime :planned_start
      t.datetime :planned_end
      t.boolean :trashed
      t.float :position
      t.uuid :meeting_id

      t.timestamps
    end
  end
end
