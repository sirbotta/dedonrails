class Chapter < ApplicationRecord
  belongs_to :act

  has_many :challenges

  def npcs
    act.npcs
  end

  def adventure
    act.adventure
  end

  def party
    adventure.party
  end

end
