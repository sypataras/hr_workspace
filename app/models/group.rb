class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :posts

  scope :without_posts, -> { includes(:posts).where(posts: { id: nil }) }
end
