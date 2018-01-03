class CreateNpcs < ActiveRecord::Migration[5.1]
  def change
    create_table :npcs do |t|
      t.string :name
      t.text :description
      t.attachment :avatar
      t.references :act, foreign_key: true

      t.timestamps
    end
  end
end
