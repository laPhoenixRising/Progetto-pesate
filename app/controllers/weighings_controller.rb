class WeighingsController < ApplicationController
  include Pagy::Backend

  def index
    if session[:utente]
      @pagy, @weighings = pagy(Weighing.where(user_id: session[:utente]).order(created_at: :desc))
    else
      redirect_to "/login"
    end
  end
  
  def create
    if session[:utente]
      Weighing.create(value: params[:weigh], user_id: session[:utente])
      redirect_to root_path
    else
      redirect_to "/login"
    end
  end

  def destroy
    if session[:utente]
      if Weighing.find_by(id: params[:id], user_id: session[:utente]) != nil
        Weighing.destroy(params[:id])
        redirect_to weighings_path
      end
    end
  end
end