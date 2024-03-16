class HomeController < ApplicationController
    before_action :must_be_logged

    def show
        @weighing = Weighing.new
        @user = User.find(session[:utente])
        @weighings = @user.last_weighings
    end
end
