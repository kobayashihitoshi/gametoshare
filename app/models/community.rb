class Community < ApplicationRecord
  has_many :community_users, dependent: :destroy
  has_many :community_posts, dependent: :destroy
  belongs_to :owner, class_name: 'User'
  has_many :users, through: :community_users, source: :user
  has_many :permits, dependent: :destroy

  def includesUser?(user)
    community_users.exists?(user_id: user.id)
  end
  
  validates :name, presence: true
  validates :introduction, presence: true
  has_one_attached :community_image
  
  def is_owned_by?(user)
    owner.id == user.id
  end
end
