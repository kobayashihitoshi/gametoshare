class Post < ApplicationRecord
    has_one_attached :image
    has_one_attached :video
    belongs_to :user
    has_many :post_comments, dependent: :destroy
    
    validates :body, presence: true
end
