class UserController < ApplicationController

  def destroy
    user = User.find(params[:id])
    u = user.weighings
    u.destroy
    user.destroy

    redirect_to root_path
  end