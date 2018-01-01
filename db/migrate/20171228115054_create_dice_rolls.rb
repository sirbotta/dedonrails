class CreateDiceRolls < ActiveRecord::Migration[5.1]
  def change
    create_table :dice_rolls do |t|
      t.integer :faces, default: 20
      t.integer :number, default: 1
      t.integer :modifier, default: 0
      t.boolean :advantage, default: false
      t.boolean :disadvantage, default: false
      t.text :reason
      t.integer :result
      t.belongs_to :rollable, polymorphic: true
      t.timestamps
    end
  end
end
