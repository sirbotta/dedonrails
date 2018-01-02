class CreatePlayerActions < ActiveRecord::Migration[5.1]
  def change
    create_table :player_actions do |t|
      t.text :description
      t.text :task_type
      t.text :resolution


      t.belongs_to :actionable, polymorphic: true
      t.belongs_to :targetable, polymorphic: true
      t.references :character, foreign_key: true
      t.timestamps
    end
  end
end
