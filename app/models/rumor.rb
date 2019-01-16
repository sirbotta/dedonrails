class Rumor < ApplicationRecord
  belongs_to :act

  has_many :targetable

  has_attached_file :image, styles: { medium: "300x300>", thumb: "150x150>", mini: "25x25>" }, default_url: "/assets/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
