class PesateController < ApplicationController
  def archive
   @weighings = Weighing.all
  end
  
  def create
  end
end