class Act < ApplicationRecord
  belongs_to :adventure
  has_many :chapters, dependent: :destroy
  has_many :npcs, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :rumors, dependent: :destroy
  validates :title, presence: true,
            length: {minimum: 5}

end
