class Act < ApplicationRecord
  belongs_to :adventure
  has_many :chapters, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5 }

end
