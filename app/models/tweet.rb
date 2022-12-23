class Tweet < ApplicationRecord


    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :reports, dependent: :destroy
    has_many :notifications, dependent: :destroy
    belongs_to :user

    validates :text,    presence: true
    validates :user_id, presence: true


# ログイン中のユーザーがその投稿に対していいねしているか判断するメソッド
    def favorited?(user)
      favorites.where(user_id: user.id).exists?
    end

    # 通報してるかしてないかの判断メソッド
    def reported_by?(user)
     reports.where(user_id: user.id).empty?
    end

    # 通知機能
    def create_notification_favorite!(current_user)
      # すでに「いいね」されているか検索
      temp = Notification.where(["visitor_id = ? and visited_id = ? and tweet_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
      # いいねされていない場合のみ、通知レコードを作成
       if temp.blank?
          notification = current_user.active_notifications.new(
          tweet_id: id,
          visited_id: user_id,
          action: 'favorite'
          )
          # 自分の投稿に対するいいねの場合は、通知済みとする
          if notification.visitor_id == notification.visited_id
             notification.checked = true
          end
          notification.save if notification.valid?
       end
    end


end
