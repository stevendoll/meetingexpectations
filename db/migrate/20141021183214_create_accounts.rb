class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :name
      t.uuid :creator_id

      t.timestamps
    end
  end
end
