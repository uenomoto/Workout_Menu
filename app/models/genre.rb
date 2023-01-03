class Genre < ApplicationRecord


    has_many :training_names, dependent: :destroy
    has_many :training_menus, dependent: :destroy
    belongs_to :user

    validates :name,    presence: true, uniqueness: { scope: :user_id }
    validates :user_id ,presence: true

end
