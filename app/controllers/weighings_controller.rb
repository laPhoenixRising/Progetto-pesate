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

  def edit
    @weighing = Weighing.find(params[:id])
  end

  def update
    @weighing = Weighing.find(params[:id])

    if @weighing.update(weighing_params)
      redirect_to weighings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def weighing_params
    params.require(:weighing).permit(:value)
  end
  
  def backup 
    user = User.find(session[:utente])
    weighings = user.archive
    data = weighings.map do |weighing|
      value = weighing.value.to_s 
      created = weighing.created_at.strftime("%d-%m-%y") 
      "#{value} #{created}"
    end.join("\n")
    send_data(data, filename: "backup.txt")
  end

end