class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum status: { normal: 0, host: 1 }
  mount_uploader :image, ImageUploader
  has_many :rooms
end
