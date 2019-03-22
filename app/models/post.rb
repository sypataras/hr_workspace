class Post < ApplicationRecord
  has_attached_file :photo
  has_attached_file :document, styles: { thumbnail: '60x60#' }
  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  has_many :groups_posts
  has_many :groups, through: :groups_posts
  has_many :users_posts
  has_many :users, through: :users_posts

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%").includes(:users_posts)
    else
      all
    end.includes(:users_posts)
  end

  def views
    users_posts.where(readed: true).count
  end
end
