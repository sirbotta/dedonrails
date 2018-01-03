class Npc < ApplicationRecord
  belongs_to :act

  has_many :targetable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "/assets/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
