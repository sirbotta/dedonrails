class Challenge < ApplicationRecord
  belongs_to :chapter
  belongs_to :challengeable, polymorphic: true
  has_many :targetable

  def generate_challengeable(ch_type)
    self.challengeable = ch_type.classify.constantize.new # remember to add the correct model
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
