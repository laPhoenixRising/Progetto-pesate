class PesateController < ApplicationController
  include Pagy::Backend

  def archive
    if session[:utente]
      @pagy, @weighings = pagy(Weighing.where(user_id: session[:utente]).order(created_at: :desc))
    else
      redirect_to "/login"
    end
  end
  
  def create
    if session[:utente]
      Weighing.create(value: params[:weigh], user_id: session[:utente])
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end

  def delete
    if session[:utente]
      if Weighing.find_by(id: params[:id], user_id: session[:utente]) != nil
        Weighing.destroy(params[:id])
        redirect_to "/archive"
      end
    end
  end
end