class CreateExplorations < ActiveRecord::Migration[5.1]
  def change
    create_table :explorations do |t|
      t.text :context

      t.timestamps
    end
  end
end
