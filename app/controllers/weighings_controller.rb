class WeighingsController < ApplicationController
  before_action :must_be_logged

  include Pagy::Backend

  def index
    user = User.find(session[:utente])
    @pagy, @weighings = pagy(user.archive)
  end
  
  def create
    @weighing = Weighing.new(weighing_params)
    @weighing.user_id = session[:utente]
    if @weighing.save
      redirect_to root_path
    else
      @user = User.find(session[:utente])
      @weighings = @user.last_weighings
      render "home/show", status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(session[:utente])
    w = user.weighings.find_by(id: params[:id])
    if w != nil
      w.destroy
      redirect_to weighings_path
    end
  end

  def weighing_params
    params.require(:weighing).permit(:value)
  end
end