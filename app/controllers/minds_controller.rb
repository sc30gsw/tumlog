class MindsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :mind, only: [:show, :edit, :update]
  
  def index
    @minds = Mind.all
  end

  def new
    @mind = Mind.new
  end

  def create
    @mind = Mind.new(mind_params)
    if @mind.valid?
      @mind.save
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
    if @mind.update(mind_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def mind_params
    params.require(:mind).permit(:text, :image).merge(user_id: current_user.id)
  end

  def mind
    @mind = Mind.find(params[:id])
  end
end
