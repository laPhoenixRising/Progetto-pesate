class LoginsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email], password: params[:password])
        if user != nil
            session[:utente] = user.id
            redirect_to root_path
        else
            redirect_to new_login_path
        end
    end

    def destroy
        session[:utente] = nil
        redirect_to new_login_path
    end
end
