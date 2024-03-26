class ApplicationController < ActionController::Base
  before_action :setting_language
  
  def must_be_logged
    redirect_to new_login_path if !session[:utente]
  end

  def setting_language
    if session[:language]
      I18n.locale = session[:language]
    end
  end

  def change_language
    session[:language] = params[:code]
    redirect_to root_path
  end
end
