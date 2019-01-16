class CreateSkillTests < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_tests do |t|
      t.text :context
      t.text :skill1
      t.text :skill1_description
      t.integer :skill1_DC, defaul: 5
      t.text :skill2
      t.text :skill2_description
      t.integer :skill2_DC, default: 10
      t.text :skill3
      t.text :skill3_description
      t.integer :skill3_DC, default: 15
      t.integer :other_skills_DC, default: 20

      t.timestamps
    end
  end
end
