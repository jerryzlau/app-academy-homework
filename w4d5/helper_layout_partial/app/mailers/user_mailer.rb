class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
  # your code here
    @user = user
    @url  = 'http://example.com/session/new'
    mail(to: user.username, subject: 'Welcome to My Awesome Site')
  end
end
