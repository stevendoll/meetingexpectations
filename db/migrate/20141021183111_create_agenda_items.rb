class CreateAgendaItems < ActiveRecord::Migration
  def change
    create_table :agenda_items, id: :uuid do |t|
      t.datetime :ends_at
      t.datetime :starts_at
      t.boolean :completed
      t.boolean :trashed
      t.text :description
      t.float :position
      t.string :presenter
      t.text :name
      t.uuid :meeting_id

      t.timestamps
    end
  end
end
