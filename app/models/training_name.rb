class TrainingName < ApplicationRecord


    has_many :training_menus, dependent: :destroy
    belongs_to :user
    belongs_to :genre

    validates :genre_id,     presence: true
    validates :user_id,      presence: true
    validates :name,         presence: true


end
