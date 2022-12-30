class Genre < ApplicationRecord


    has_many :training_names, dependent: :destroy
    has_many :training_menus, dependent: :destroy
    belongs_to :user

    validates :name ,presence: true
    validates :user_id ,presence: true

end
