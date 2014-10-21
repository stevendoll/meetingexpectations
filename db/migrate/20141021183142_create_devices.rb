class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, id: :uuid do |t|
      t.string :device_type
      t.string :device_token
      t.uuid :user_id

      t.timestamps
    end
  end
end
