class PesateController < ApplicationController
  include Pagy::Backend

  def archive
    if session[:utente]
      @pagy, @weighings = pagy(Weighing.all.order(created_at: :desc))
    else
      redirect_to "/login"
    end
  end
  
  def create
    Weighing.create(value: params[:weigh])
    redirect_to "/"
  end
end