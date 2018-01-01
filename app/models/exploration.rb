class Exploration < ApplicationRecord
  has_one :challenge, as: :challengeable
  has_many :actions, as: :actionable


  POSSIBLE_ACTIONS = ['explore','investigate']


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
