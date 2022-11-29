class Genre < ApplicationRecord


    has_many :training_names, dependent: :destroy
    belongs_to :user

    validates :name ,presence: true

end
