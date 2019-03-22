class GroupsPost < ApplicationRecord
  belongs_to :group
  belongs_to :post

  before_create :add_user_to_post

  def add_user_to_post
    self.group.users.each do |user|
      user.users_posts.find_or_create_by(post_id: self.post_id)
    end
  end
end
