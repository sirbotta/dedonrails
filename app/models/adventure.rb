class Adventure < ApplicationRecord

  has_many :acts, dependent: :destroy
  has_one :party, dependent: :destroy

  validates :title, presence: true,
            length: { minimum: 5 }


  def dm
    User.find(dm_id)
  end


end
