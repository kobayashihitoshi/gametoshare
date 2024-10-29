class CommunityPost < ApplicationRecord
  has_one_attached :image
  has_one_attached :video
  
  belongs_to :user
  belongs_to :community
  
  validates :body, presence: true
end
