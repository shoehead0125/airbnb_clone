class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum status: { normal: 0, host: 1 }
  has_many :rooms
  has_many :resavations
  has_many :messages

  def name
    self.first_name + ' ' + self.last_name
  end
end
