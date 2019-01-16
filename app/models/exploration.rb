class Exploration < ApplicationRecord
  has_one :challenge, as: :challengeable, dependent: :destroy
  has_many :player_actions, as: :actionable

  TASKS = {
      explore: {
          skill: 'perception',
          target: 'location',
          description: 'Discover new information about locations in the area'
      },
      investigate: {
          skill: 'investigation',
          target: 'npc',
          description: 'Investigate about an npc in the area'
      },
      interrogate: {
          skill: 'intimidation',
          target: 'npc',
          description: 'Interrogate an npc in the area'
      },
      gather_information: {
          skill: 'persuasion',
          target: 'npc',
          description: 'Ask local rumors to an npc in the area'
      },
      spy: {
          skill: 'stealth',
          target: 'npc',
          description: 'Follow an NPC without attracting attention'
      },
      examine: {
          skill: 'insight',
          target: 'rumor',
          description: 'Gather extra clues about a rumor in the area'
      },
      research: {
          skill: 'history',
          target: 'rumor',
          description: 'Do some research about a local rumor'
      }
  }

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
