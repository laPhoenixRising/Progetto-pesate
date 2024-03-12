class WeighingsController < ApplicationController
  before_action :must_be_logged

  include Pagy::Backend

  def index
    @pagy, @weighings = pagy(Weighing.where(user_id: session[:utente]).order(created_at: :desc))
  end
  
  def create
    Weighing.create(value: params[:weigh], user_id: session[:utente])
    redirect_to root_path
  end

  def destroy
    if Weighing.find_by(id: params[:id], user_id: session[:utente]) != nil
      Weighing.destroy(params[:id])
      redirect_to weighings_path
    end
  end
end