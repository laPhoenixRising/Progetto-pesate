class LoginsController < ApplicationController
    before_action :must_be_logged, only: [:destroy]
    
    def new
    end

    def create
        user = User.find_by(email: params[:email], password: params[:password], confirmed: true)
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
