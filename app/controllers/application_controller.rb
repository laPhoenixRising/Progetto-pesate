class ApplicationController < ActionController::Base
  before_action :setting_language
  
  def must_be_logged
    redirect_to new_login_path if !session[:utente]
  end

  def setting_language
    I18n.locale = :it
  end
end
