class EarliesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @earlies = Early.all
  end

  def new
    @early = Early.new
  end
  
  def create
    @early = Early.new(early_params)
    if @early.valid?
      @early.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @early = Early.find(params[:id])
  end

  private

  def early_params
    params.require(:early).permit(:text, :image).merge(user_id: current_user.id)
  end
end
