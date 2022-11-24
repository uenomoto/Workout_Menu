class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :training_names, dependent: :destroy
  has_many :training_menus, dependent: :destroy
  has_many :impressions, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :nickname,       uniqueness: true, presence: true
  validates :introduction,   length: { minimum: 5 }
  validates :prefecture,     presence: true
  validates :email,          uniqueness: true, presence: true
  
end
