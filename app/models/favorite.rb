class Favorite < ApplicationRecord
    
    
    belongs_to :user
    belongs_to :impression
    
    validates :user_id,       presence: true
    validates :impression_id, presence: true
    
end
