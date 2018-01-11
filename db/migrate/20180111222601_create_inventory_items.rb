class CreateInventoryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_items do |t|
      t.integer :characterID
      t.integer :itemID

      t.timestamps
    end
  end
end
