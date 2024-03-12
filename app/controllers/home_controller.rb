class HomeController < ApplicationController
    before_action :must_be_logged

    def show
        @user = User.find(session[:utente])
        @weighings = @user.last_weighings
    end
end
