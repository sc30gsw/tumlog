class LearnsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

  private

  def learn_params
    params.require(:learn).permit(:text, :image).merge(user_id: current_user.id)
  end
end
