class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings, id: :uuid do |t|
      t.text :name
      t.text :description
      t.boolean :trashed
      t.boolean :template
      t.boolean :draft
      t.boolean :archived
      t.boolean :completed
      t.text :privacy
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :all_day
      t.uuid :creator_id
      t.uuid :account_id
      t.uuid :location_id
      t.text :location_comments
      t.string :color

      t.timestamps
    end
  end
end
