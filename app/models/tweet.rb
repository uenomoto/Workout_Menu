class Tweet < ApplicationRecord


    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    belongs_to :user

    validates :text,    presence: true
    validates :user_id, presence: true


# ログイン中のユーザーがその投稿に対していいねしているか判断するメソッド
    def favorited?(user)
      favorites.where(user_id: user.id).exists?
    end

end
