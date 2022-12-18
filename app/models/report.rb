class Report < ApplicationRecord

  belongs_to :user
  belongs_to :tweet

  validates :tweet_id, uniqueness: { scope: :user_id }

end
