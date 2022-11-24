class TrainingMenu < ApplicationRecord
    
    
    belongs_to :user
    belongs_to :training_name
    
    validates :user_id,          presence: true
    validates :training_name_id, presence: true
    validates :date,             presence: true
    validates :count,            numericality: { only_integer: true }
    validates :set,              numericality: { only_integer: true }
    validates :weight,           numericality: { only_integer: true }
    
end