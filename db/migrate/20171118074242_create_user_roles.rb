class CreateUserRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_roles do |t|
      t.belongs_to :user, index: true
      t.integer :role
      t.timestamps
    end
  end
end
