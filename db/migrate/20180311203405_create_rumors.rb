class CreateRumors < ActiveRecord::Migration[5.1]
  def change
    create_table :rumors do |t|
      t.string :name
      t.text :description
      t.attachment :image
      t.references :act, foreign_key: true

      t.timestamps
    end
  end
end
