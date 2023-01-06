class Notification < ApplicationRecord

  # デフォルトの並び順を「作成日時の降順」で指定
  default_scope -> { order(created_at: :desc) }
  # optional: trueとはnilを許可するもの。
  belongs_to :tweet,        optional: true
  belongs_to :post_comment, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

end
