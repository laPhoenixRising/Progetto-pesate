class PesateController < ApplicationController
  include Pagy::Backend

  def archive
   @pagy, @weighings = pagy(Weighing.all.order(created_at: :desc))
  end
  
  def create
    Weighing.create(value: params[:weigh])
    redirect_to "/"
  end
end