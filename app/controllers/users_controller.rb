class UsersController < ApplicationController

  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:utente] = nil

    redirect_to root_path
  end
end