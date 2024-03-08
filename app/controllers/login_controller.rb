class LoginController < ApplicationController
    def show
    end

    def authenticate
        user = User.find_by(email: params[:address], password: params[:password])
        if user != nil
            session[:utente] = user.id
            redirect_to "/"
        else
            redirect_to "/login"
        end
    end
end
