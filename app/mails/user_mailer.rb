class UserMailer < ActionMailer::Base
  default from: 'no_reply@stepups_dev.com'

  def welcome(user)
    @user = user
    mail(to: user.email,
         subject: "[Signed up] Welcome #{user.email}")
  end
end
