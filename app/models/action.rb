class Action < ApplicationRecord
  belongs_to :actionable, polymorphic: true
  has_one :ability_roll, as: :rollable
end
