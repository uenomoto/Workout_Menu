class Genre < ApplicationRecord
    
    
    has_many :training_names, dependent: :destroy
    
    validates :name ,presence: true
    
end
