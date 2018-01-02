class DieRoll < ApplicationRecord

  belongs_to :rollable, polymorphic: true

  def roll
    if is_a_test?
      if advantage
        dice = [single_dice_roll, single_dice_roll].max
      elsif disadvantage
        dice = [single_dice_roll, single_dice_roll].min
      else
        dice = single_dice_roll
      end
      self.result = (dice + modifier).to_i
    else
      self.result = (multi_roll + modifier).to_i
    end
    save
    result
  end

  private

  def single_dice_roll
    res = Random.new.rand(faces) + 1
    Rails.logger.debug("Rolled a D#{faces} with result #{res}")
    res
  end

  def multi_roll
    res = 0
    number.times do
      res+= single_dice_roll
    end
    res
  end

  def check_roll

  end

  def is_a_test?
    faces == 20
  end

end
