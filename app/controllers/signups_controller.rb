require "securerandom"

class SignupsController < ApplicationController
  before_action :must_not_be_logged
 
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    user_params[:secret] = SecureRandom.hex
    user_params[:confirmed] = false
    @user = User.new(user_params)
    if @user.save
      redirect_to new_login_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirm
    user = User.find_by(secret: params[:secret])
    if user == nil
      redirect_to root_path
    else
      user.update(confirmed: true, secret: nil)
      redirect_to new_login_path
    end
  end

end
