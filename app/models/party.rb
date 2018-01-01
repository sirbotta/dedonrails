class Party < ApplicationRecord
  belongs_to :adventure
  has_many :characters

  def find_character_by_user_id(user_id)
    characters.where(user_id: user_id).first
  end

end
