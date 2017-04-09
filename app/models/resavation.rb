class Resavation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :messages
  enum status: { request: 0, confirm: 1 }
  enum status_review: { not_post: 0, posted: 1}

  def days
    days = self.end_day - self.start_day
    return days.to_i
  end
end
