class TrainingMenu < ApplicationRecord


    belongs_to :user
    belongs_to :training_name
    belongs_to :genre

    validates :user_id,          presence: true
    validates :training_name_id, presence: true
    validates :genre_id,         presence: true
    validates :date,             presence: true
    validates :count,            numericality: { only_integer: true }
    validates :set,              numericality: { only_integer: true }

    enum status: { "自重":0, "加重":1, "有酸素":2 }

end
