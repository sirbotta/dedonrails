class PlayerAction < ApplicationRecord
  has_one :die_roll, as: :rollable
  belongs_to :actionable, polymorphic: true
  belongs_to :targetable, polymorphic: true
  belongs_to :character

end
