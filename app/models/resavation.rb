class Resavation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  enum status: { request: 0, confirm: 1 }
end
