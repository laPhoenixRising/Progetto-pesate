class HomeController < ApplicationController
    def show
        if session[:utente]
            @user = User.find(session[:utente])
            @weighings = Weighing.where(user_id: session[:utente]).limit(10).order(created_at: :desc)
        else
            redirect_to new_login_path
        end
    end
end
