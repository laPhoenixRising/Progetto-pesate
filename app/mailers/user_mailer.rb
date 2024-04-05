class UserMailer < ApplicationMailer

  default from: 'notifications@pesate.olisti.co'

  def signup_confirmation
    @user = params[:user]
    @url  = confirm_signup_url(secret: @user.secret)
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
