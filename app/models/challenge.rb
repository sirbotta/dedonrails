class Challenge < ApplicationRecord
  belongs_to :chapter
  belongs_to :challengeable, polymorphic: true
  has_many :targetable


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
