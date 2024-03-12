class HomeController < ApplicationController
    before_action :must_be_logged
    
    def show
        @user = User.find(session[:utente])
        @weighings = Weighing.where(user_id: session[:utente]).limit(10).order(created_at: :desc)
    end
end
