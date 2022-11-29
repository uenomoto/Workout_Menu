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
  has_many :genres, dependent: :destroy

  validates :nickname,       uniqueness: true, presence: true
  validates :introduction,   length: { minimum: 5 }
  validates :prefecture,     presence: true
  validates :email,          uniqueness: true, presence: true
  validates :profile_image,          presence: true


  has_one_attached :profile_image

 def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpeg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    profile_image.variant(resize_to_limit: [width, height]).processed
 end

end
