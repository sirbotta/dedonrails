class AddAdventureIdToActs < ActiveRecord::Migration[5.1]
  def change
    add_reference :acts, :adventure, foreign_key: true
  end
end
