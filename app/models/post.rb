class Post < ApplicationRecord
  has_attached_file :photo
  has_attached_file :document, styles: { thumbnail: '60x60#' }
  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  has_and_belongs_to_many :groups
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

  def add_group(group_id)
    if self.groups_posts.find(group_id: group_id).nil?
      self.groups_posts.create_by(group_id: params[:group_id])
      Group.find(group_id).users.each do |user|
        user.users_posts.find_or_create_by(post_id: self.post_id)
      end
    end
  end
end
