class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :post_images, dependent: :destroy
  has_many :books, dependent: :destroy
  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
