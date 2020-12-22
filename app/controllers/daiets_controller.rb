class DaietsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :daiet, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @daiet.update(daiet_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @daiet.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  private

  def daiet_params
    params.require(:daiet).permit(:text, :image).merge(user_id: current_user.id)
  end

  def daiet
    @daiet = Daiet.find(params[:id])
  end
end
