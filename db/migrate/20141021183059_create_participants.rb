class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants, id: :uuid do |t|
      t.uuid :meeting_id
      t.uuid :user_id
      t.boolean :attended
      t.text :description

      t.timestamps
    end
  end
end
