class PesateController < ApplicationController
  include Pagy::Backend

  def archive
   @pagy, @weighings = pagy(Weighing.all)
  end
  
  def create
  end
end