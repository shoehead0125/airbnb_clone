class Room < ApplicationRecord
  enum category: { reserved: 0, privated: 1, shared: 2 }
  belongs_to :user
end
