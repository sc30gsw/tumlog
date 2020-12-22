class DaietsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @daiets = Daiet.all
  end

  def new
    @daiet = Daiet.new
  end

  def create
    @daiet = Daiet.new(daiet_params)
    if @daiet.valid?
      @daiet.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @daiet = Daiet.find(params[:id])
  end

  private

  def daiet_params
    params.require(:daiet).permit(:text, :image).merge(user_id: current_user.id)
  end
end
