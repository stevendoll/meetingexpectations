class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations, id: :uuid do |t|
      t.string :name
      t.text :address_1
      t.text :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.uuid :account_id

      t.timestamps
    end
  end
end
