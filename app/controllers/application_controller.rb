class ApplicationController < ActionController::Base
  def must_be_logged
    redirect_to new_login_path if !session[:utente]
  end
end
