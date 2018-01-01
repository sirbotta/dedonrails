class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.text :description
      t.text :action_type
      t.text :resolution


      t.belongs_to :actionable, polymorphic: true
      t.references :character, foreign_key: true
      t.timestamps
    end
  end
end
