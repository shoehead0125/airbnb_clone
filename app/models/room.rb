class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :resavations
  has_many :reviews
  enum category: { reserved: 0, privated: 1, shared: 2 }
  geocoded_by :adress
  after_validation :geocode, if: :adress_changed?

  def reviews_average
    reviews.average(:rate).to_i.round
  end
end
