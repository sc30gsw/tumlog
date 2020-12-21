class SavingsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @savings = Saving.all
  end

  def new
    @saving = Saving.new
  end

  def create
    @saving = Saving.new(saving_params)
    if @saving.valid?
      @saving.save
      redirect_to action: :index
    else
      render :new
    end
  end
  
  private

  def saving_params
    params.require(:saving).permit(:text, :image).merge(user_id: current_user.id)
  end
end
