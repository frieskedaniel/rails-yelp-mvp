class Review < ApplicationRecord
    belongs_to :restaurant, dependent: :destroy
    validates :content, :rating, presence: true
    validates :rating, inclusion: { in: [0,1,2,3], allow_nil: false } 
    
end
