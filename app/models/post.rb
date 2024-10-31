class Post < ApplicationRecord
  has_one_attached :image
  has_one_attached :video
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  
  validates :body, presence: true
  
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("body LIKE?","#{word}")
    elsif search == "partial_match"
      @post = Post.where("body LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
end
