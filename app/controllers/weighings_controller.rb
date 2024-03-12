class WeighingsController < ApplicationController
  before_action :must_be_logged

  include Pagy::Backend

  def index
    user = User.find(session[:utente])
    @pagy, @weighings = pagy(user.archive)
  end
  
  def create
    user = User.find(session[:utente])
    user.weighings.create(value: params[:weigh])
    redirect_to root_path
  end

  def destroy
    user = User.find(session[:utente])
    w = user.weighings.find_by(id: params[:id])
    if w != nil
      w.destroy
      redirect_to weighings_path
    end
  end
end