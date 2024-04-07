# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def signup_confirmation
    UserMailer.with(user: User.first).signup_confirmation
  end
end
