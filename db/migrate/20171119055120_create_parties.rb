class CreateParties < ActiveRecord::Migration[5.1]
  def change
    create_table :parties do |t|
      t.string :name
      t.numeric :max_members
      t.references :adventure, foreign_key: true

      t.timestamps
    end
  end
end
