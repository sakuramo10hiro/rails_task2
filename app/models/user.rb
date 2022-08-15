class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, uniqueness: true, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable      
  mount_uploader :user_image, ImageUploader #アップローダーを関連するモデルと紐付け。
  has_many :rooms
  has_many :reservations
  has_one_attached :image
end
