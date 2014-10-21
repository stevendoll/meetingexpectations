class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups, id: :uuid do |t|
      t.string :name
      t.uuid :account_id
      t.uuid :creator_id
      t.uuid :parent_group_id

      t.timestamps
    end
  end
end
