class PostComment < ApplicationRecord


    belongs_to :user
    belongs_to :tweet

    validates :user_id,       presence: true
    validates :tweet_id, presence: true
    validates :comment,       presence: true

end
