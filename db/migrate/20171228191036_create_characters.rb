class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.text :name, required: true
      t.references :party, foreign_key: true
      t.references :user, foreign_key: true
      t.text :dnd_class, default: 'fighter'
      t.text :dnd_race, default: 'human'
      t.text :dnd_alignment, default: 'neutral'
      t.text :dnd_background, default: 'acolyte'

      t.text :gender, default: 'male'

      t.integer :level, default: 1
      t.integer :experience, default: 0
      t.integer :proficiency_bonus, default: 2


      t.integer :str, default: 10
      t.integer :dex, default: 10
      t.integer :cos, default: 10
      t.integer :int, default: 10
      t.integer :wis, default: 10
      t.integer :cha, default: 10

      t.integer :class_hp, default: 1
      t.integer :current_hp, default: 1
      t.integer :armor_class, default: 10

      t.boolean :save_str, default: false
      t.boolean :save_dex, default: false
      t.boolean :save_cos, default: false
      t.boolean :save_int, default: false
      t.boolean :save_wis, default: false
      t.boolean :save_cha, default: false

      t.boolean :skill_acrobatics, default: false
      t.boolean :skill_animal_handling, default: false
      t.boolean :skill_arcana, default: false
      t.boolean :skill_athletics, default: false
      t.boolean :skill_deception, default: false
      t.boolean :skill_history, default: false
      t.boolean :skill_insight, default: false
      t.boolean :skill_intimidation, default: false
      t.boolean :skill_investigation, default: false
      t.boolean :skill_medicine, default: false
      t.boolean :skill_nature, default: false
      t.boolean :skill_perception, default: false
      t.boolean :skill_performance, default: false
      t.boolean :skill_persuasion, default: false
      t.boolean :skill_religion, default: false
      t.boolean :skill_sleight_of_hand, default: false
      t.boolean :skill_stealth, default: false
      t.boolean :skill_survival, default: false

      t.integer :personality_trait, default: 1
      t.integer :ideal, default: 1
      t.integer :bond, default: 1
      t.integer :flaw, default: 1


      t.timestamps
    end
  end
end
