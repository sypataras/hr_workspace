class UserMailer < ApplicationMailer
  def send_new_post(email, post)
    @post = post
    mail(to: email, subject: 'New post wos created!')
  end
end
