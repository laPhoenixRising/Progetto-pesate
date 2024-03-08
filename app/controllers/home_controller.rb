class HomeController < ApplicationController
    def show
        if session[:utente]
            @user = User.find(session[:utente])
            @weighings = Weighing.limit(10).order(created_at: :desc)
        else
            redirect_to "/login"
        end
    end
end
