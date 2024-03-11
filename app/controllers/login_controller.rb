class LoginController < ApplicationController
    def show
    end

    def authenticate
        user = User.find_by(email: params[:email], password: params[:password])
        if user != nil
            session[:utente] = user.id
            redirect_to root_path
        else
            redirect_to "/login"
        end
    end

    def destroy
        session[:utente] = nil
        redirect_to "/login"
    end
end
