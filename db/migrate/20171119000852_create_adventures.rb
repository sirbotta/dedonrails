class CreateAdventures < ActiveRecord::Migration[5.1]
  def change
    create_table :adventures do |t|
      t.string :title
      t.string :sub_title
      t.numeric :dm_id

      t.timestamps
    end
  end
end
