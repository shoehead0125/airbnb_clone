class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  enum category: { reserved: 0, privated: 1, shared: 2 }

  geocoded_by :adress
  after_validation :geocode, if: :adress_changed?
  belongs_to :user
end
