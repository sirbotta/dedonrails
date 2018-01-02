# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171228191036) do

  create_table "acts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "adventure_id"
    t.index ["adventure_id"], name: "index_acts_on_adventure_id"
  end

  create_table "adventures", force: :cascade do |t|
    t.string "title"
    t.string "sub_title"
    t.decimal "dm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "chapter_id"
    t.string "challengeable_type"
    t.integer "challengeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challengeable_type", "challengeable_id"], name: "index_challenges_on_challengeable_type_and_challengeable_id"
    t.index ["chapter_id"], name: "index_challenges_on_chapter_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "act_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["act_id"], name: "index_chapters_on_act_id"
  end

  create_table "characters", force: :cascade do |t|
    t.text "name"
    t.integer "party_id"
    t.integer "user_id"
    t.text "dnd_class", default: "fighter"
    t.text "dnd_race", default: "human"
    t.text "dnd_alignment", default: "neutral"
    t.text "dnd_background", default: "acolyte"
    t.text "gender", default: "male"
    t.integer "level", default: 1
    t.integer "experience", default: 0
    t.integer "proficiency_bonus", default: 2
    t.integer "str", default: 10
    t.integer "dex", default: 10
    t.integer "cos", default: 10
    t.integer "int", default: 10
    t.integer "wis", default: 10
    t.integer "cha", default: 10
    t.integer "class_hp", default: 1
    t.integer "current_hp", default: 1
    t.integer "armor_class", default: 10
    t.boolean "save_str", default: false
    t.boolean "save_dex", default: false
    t.boolean "save_cos", default: false
    t.boolean "save_int", default: false
    t.boolean "save_wis", default: false
    t.boolean "save_cha", default: false
    t.boolean "skill_acrobatics", default: false
    t.boolean "skill_animal_handling", default: false
    t.boolean "skill_arcana", default: false
    t.boolean "skill_athletics", default: false
    t.boolean "skill_deception", default: false
    t.boolean "skill_history", default: false
    t.boolean "skill_insight", default: false
    t.boolean "skill_intimidation", default: false
    t.boolean "skill_investigation", default: false
    t.boolean "skill_medicine", default: false
    t.boolean "skill_nature", default: false
    t.boolean "skill_perception", default: false
    t.boolean "skill_performance", default: false
    t.boolean "skill_persuasion", default: false
    t.boolean "skill_religion", default: false
    t.boolean "skill_sleight_of_hand", default: false
    t.boolean "skill_stealth", default: false
    t.boolean "skill_survival", default: false
    t.integer "personality_trait", default: 1
    t.integer "ideal", default: 1
    t.integer "bond", default: 1
    t.integer "flaw", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_characters_on_party_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "die_rolls", force: :cascade do |t|
    t.integer "faces", default: 20
    t.integer "number", default: 1
    t.integer "modifier", default: 0
    t.boolean "advantage", default: false
    t.boolean "disadvantage", default: false
    t.text "reason"
    t.integer "result"
    t.string "rollable_type"
    t.integer "rollable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rollable_type", "rollable_id"], name: "index_die_rolls_on_rollable_type_and_rollable_id"
  end

  create_table "explorations", force: :cascade do |t|
    t.text "context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.decimal "max_members"
    t.integer "adventure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adventure_id"], name: "index_parties_on_adventure_id"
  end

  create_table "player_actions", force: :cascade do |t|
    t.text "description"
    t.text "task_type"
    t.text "resolution"
    t.string "actionable_type"
    t.integer "actionable_id"
    t.string "targetable_type"
    t.integer "targetable_id"
    t.integer "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actionable_type", "actionable_id"], name: "index_player_actions_on_actionable_type_and_actionable_id"
    t.index ["character_id"], name: "index_player_actions_on_character_id"
    t.index ["targetable_type", "targetable_id"], name: "index_player_actions_on_targetable_type_and_targetable_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
