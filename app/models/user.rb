class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :groups

  has_many :users_posts
  has_many :posts, through: :users_posts

  scope :show_users, -> { where(admin: false) }
  scope :without_posts, -> { includes(:posts).where(posts: { id: nil }) }

  def self.search(search)
    if search
      show_users.where('first_name LIKE :val OR last_name LIKE :val', val: "%#{search}%")
    else
      show_users
    end
  end

  def readed(post_id)
    post = users_posts.find_by(post_id: post_id)
    post.update_attributes(readed: true) unless post.readed
  end

  def admin?
    self.admin
  end
end
