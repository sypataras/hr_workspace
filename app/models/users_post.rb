class UsersPost < ApplicationRecord
  belongs_to :user
  belongs_to :post

  before_create :send_email

  private

  def send_email
    UserMailer.send_new_post(self.user.email, self.post).deliver
  end
end
