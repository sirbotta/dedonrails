class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|

      t.string :title
      t.text :text

      t.references :chapter, foreign_key: true
      t.belongs_to :challengeable, polymorphic: true
      t.timestamps
    end
  end
end
