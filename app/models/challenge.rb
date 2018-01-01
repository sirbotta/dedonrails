class Challenge < ApplicationRecord
  belongs_to :chapter
  belongs_to :challengeable, polymorphic: true

  def generate_challengeable(ch_type)
    case ch_type
      when 'exploration'
        self.challengeable = Exploration.new
      else
        nil
    end
    self.challengeable
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
