class Character < ApplicationRecord

  after_create :add_race_adjustments
  after_create :add_class_adjustments
  after_create :add_known_skills_adjustments

  belongs_to :party
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "/assets/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def str_bonus
    calc_ability_bonus(str)
  end

  def dex_bonus
    calc_ability_bonus(dex)
  end

  def cos_bonus
    calc_ability_bonus(cos)
  end

  def int_bonus
    calc_ability_bonus(int)
  end

  def wis_bonus
    calc_ability_bonus(wis)
  end

  def cha_bonus
    calc_ability_bonus(cha)
  end

  def initiative
    dex_bonus
  end

  def max_hp
    class_hp + level * cos_bonus
  end

  def level_up?
    experience >= DndRules::LEVEL_TIERS[level-1]
  end

  def owner
    User.find(user_id)
  end

  def party
    Party.find(party_id)
  end

  def all_abilities
    {
        str: {
            score: str,
            bonus: str_bonus
        },
        dex: {
            score: dex,
            bonus: dex_bonus
        },
        cos: {
            score: cos,
            bonus: cos_bonus
        },
        int: {
            score: int,
            bonus: int_bonus
        },
        wis: {
            score: wis,
            bonus: wis_bonus
        },
        cha: {
            score: cha,
            bonus: cha_bonus
        },
    }
  end

  def all_saves
    {
        str: {
            proficient: save_str,
            bonus: calc_save_bonus(save_str, str_bonus)
        },
        dex: {
            proficient: save_dex,
            bonus: calc_save_bonus(save_dex, dex_bonus)
        },
        cos: {
            proficient: save_cos,
            bonus: calc_save_bonus(save_cos, cos_bonus)
        },
        int: {
            proficient: save_int,
            bonus: calc_save_bonus(save_int, int_bonus)
        },
        wis: {
            proficient: save_wis,
            bonus: calc_save_bonus(save_wis, wis_bonus)
        },
        cha: {
            proficient: save_cha,
            bonus: calc_save_bonus(save_cha, cha_bonus)
        },
    }
  end

  def all_skills
    {
        acrobatics: {
            proficient: skill_acrobatics,
            bonus: calc_save_bonus(skill_acrobatics, dex_bonus)
        },
        animal_handling: {
            proficient: skill_animal_handling,
            bonus: calc_save_bonus(skill_animal_handling, cha_bonus)
        },
        arcana: {
            proficient: skill_arcana,
            bonus: calc_save_bonus(skill_arcana, int_bonus)
        },
        athletics: {
            proficient: skill_athletics,
            bonus: calc_save_bonus(skill_athletics, str_bonus)
        },
        deception: {
            proficient: skill_deception,
            bonus: calc_save_bonus(skill_deception, cha_bonus)
        },
        history: {
            proficient: skill_history,
            bonus: calc_save_bonus(skill_history, int_bonus)
        },
        insight: {
            proficient: skill_insight,
            bonus: calc_save_bonus(skill_insight, wis_bonus)
        },
        investigation: {
            proficient: skill_investigation,
            bonus: calc_save_bonus(skill_investigation, int_bonus)
        },
        intimidation: {
            proficient: skill_intimidation,
            bonus: calc_save_bonus(skill_intimidation, cha_bonus)
        },
        medicine: {
            proficient: skill_medicine,
            bonus: calc_save_bonus(skill_medicine, wis_bonus)
        },
        nature: {
            proficient: skill_nature,
            bonus: calc_save_bonus(skill_nature, int_bonus)
        },
        perception: {
            proficient: skill_perception,
            bonus: calc_save_bonus(skill_perception, wis_bonus)
        },
        performance: {
            proficient: skill_performance,
            bonus: calc_save_bonus(skill_performance, cha_bonus)
        },
        persuasion: {
            proficient: skill_persuasion,
            bonus: calc_save_bonus(skill_persuasion, cha_bonus)
        },
        religion: {
            proficient: skill_religion,
            bonus: calc_save_bonus(skill_religion, int_bonus)
        },
        sleight_of_hand: {
            proficient: skill_sleight_of_hand,
            bonus: calc_save_bonus(skill_sleight_of_hand, dex_bonus)
        },
        stealth: {
            proficient: skill_stealth,
            bonus: calc_save_bonus(skill_stealth, dex_bonus)
        },
        survival: {
            proficient: skill_survival,
            bonus: calc_save_bonus(skill_survival, wis_bonus)
        },
    }
  end

  def all_features
    race_features = DndRules::RACES[dnd_race.to_sym].fetch(:features, [])
    class_features = []
    level.times do |lvl|
      class_features += DndRules::CLASSES[dnd_class.to_sym][:levels][(lvl+1).to_s.to_sym].fetch(:features, [])
    end
    background_features = DndRules::BACKGROUNDS.fetch(dnd_background.to_sym,{}).fetch(:features, [])
    race_features + class_features + background_features
  end

  def known_skills
    ks = DndRules::BACKGROUNDS.fetch(dnd_background.to_sym,{}).fetch(:skills, [])

    if all_features.include?('keen_senses')
      ks << 'perception'
    end

    ks
  end

  def available_skills
    class_infos = DndRules::CLASSES[dnd_class.to_sym]
    class_infos.fetch(:skills, []) - known_skills
  end

  def max_available_skills
    class_infos = DndRules::CLASSES[dnd_class.to_sym]
    class_infos.fetch(:skills_max, 0)
  end

  def personality_trait_text
    DndRules::BACKGROUNDS[dnd_background.to_sym].fetch(:personality_traits, [])[personality_trait-1]
  end

  def ideal_text
    DndRules::BACKGROUNDS[dnd_background.to_sym].fetch(:ideals, [])[ideal-1]
  end

  def bond_text
    DndRules::BACKGROUNDS[dnd_background.to_sym].fetch(:bonds, [])[bond-1]
  end

  def flaw_text
    DndRules::BACKGROUNDS[dnd_background.to_sym].fetch(:flaws, [])[flaw-1]
  end

  private

  def calc_ability_bonus(ability_score)
    (ability_score - 10) / 2
  end

  def calc_save_bonus(proficient, ability_bonus)
    if proficient
      proficiency_bonus + ability_bonus
    else
      ability_bonus
    end
  end

  def add_race_adjustments
    DndRules::RACES[dnd_race.to_sym].fetch(:abilities, []).each do |abl, incr|
      update_attribute(abl, self.send(abl) + incr)
    end
  end

  def add_class_adjustments
    class_infos = DndRules::CLASSES[dnd_class.to_sym]
    class_infos.fetch(:saves, []).each do |save|
      update_attribute(save, true)
    end
    update_attribute(:class_hp, class_infos[:hitpoints])
    reset_current_hp
  end

  def add_known_skills_adjustments
    known_skills.each do |skl|
      update_attribute("skill_#{skl}".to_sym, true)
    end
  end

  def reset_current_hp
    update_attribute(:current_hp, max_hp)
  end

end
