class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :training_names, dependent: :destroy
  has_many :training_menus, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :reports, dependent: :destroy

  validates :nickname,       uniqueness: true, presence: true
  validates :introduction,   length: { minimum: 5 }
  validates :prefecture,     presence: true
  validates :email,          uniqueness: true, presence: true


  has_one_attached :profile_image
# 画像のメソッド
 def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpeg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    profile_image.variant(resize_to_limit: [width, height]).processed
 end


 enum prefecture: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
 }


# サーチ機能
    def self.search_for(word,method)
    return none if word.blank?
       if method == 'perfect'
       User.where(nickname: word)

     elsif method == 'forward'
       User.where('nickname LIKE ?', word + '%')

     elsif method == 'backword'
       User.where('nickname LIKE ?', '%' + word)
     else
       User.where('nickname LIKE ?', '%' + word + '%')
     end
    end

# ゲストログイン
    def self.guest
      find_or_create_by!(nickname: 'guestuser' ,email: 'guest@example.com', prefecture: 22, introduction: 'ゲストですよ。') do |user|
       user.password = SecureRandom.urlsafe_base64
       user.nickname = "guestuser"
     end
    end
    # フォロー関係
    # 自分がフォローされる
    # foreign_key（FK）には、@user.reverse_of_relationshipsとした際に@user.idがfollowed_idを指定
    has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    # 自分がフォローする
    has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

    # 自分をフォローしている人の一覧
    has_many :followers, through: :reverse_of_relationships, source: :follower
    # 自分がフォローしている人の一覧
    has_many :followings, through: :relationships, source: :followed

    # フォロー・フォロワー関連のメソッド
    def follow(user_id)
     relationships.create(followed_id: user_id)
    end
    # フォロー解除
    def unfollow(user_id)
     relationships.find_by(followed_id: user_id).destroy
    end
    # フォローしてる人含む？
    def following?(user)
     followings.include?(user)
    end

    # 通知関係
    # 自分からの通知
    has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
    # 相手からの通知
    has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

    # フォローした時の通知の作成メソッド
    def create_notification_follow!(current_user, visited_id)
       temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, visited_id, 'follow'])
       if temp.blank?
         notification = current_user.active_notifications.new(
          visited_id: visited_id,
          action: 'follow'
          )
        notification.save if notification.valid?
       end
    end

end
