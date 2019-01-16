class SkillTest < ApplicationRecord
  has_one :challenge, as: :challengeable, dependent: :destroy
  has_many :player_actions, as: :actionable


  def resolve_action(player_action)
    expl_action = TASKS[player_action.task_type.to_sym]
    bonus = player_action.character.all_skills[expl_action[:skill].to_sym][:bonus]
    reason = "#{player_action.character.name} #{player_action.task_type}"
    dr = DieRoll.create(modifier: bonus, reason: reason)
    dr.rollable = player_action
    dr.save
    dr.roll
  end

  def chapter
    challenge.chapter
  end

  def act
    chapter.act
  end

  def adventure
    act.adventure
  end

  def party
    adventure.party
  end

end
