class Tour < ApplicationRecord
  belongs_to :user
  has_many :resavations
end
