class LearnsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :learn, only: [:show, :edit, :update, :destroy]

  def index
    @learns = Learn.all
  end

  def new
    @learn = Learn.new
  end

  def create
    @learn = Learn.new(learn_params)
    if @learn.valid?
      @learn.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @learn.user_id
      redirect_to action: :index
    end
  end

  def update
    if @learn.update(learn_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @learn.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  private

  def learn_params
    params.require(:learn).permit(:text, :image).merge(user_id: current_user.id)
  end

  def learn
    @learn = Learn.find(params[:id])
  end
end
