class MindsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :mind, only: [:show, :edit, :update, :destroy]
  
  def index
    @minds = Mind.all.order(id: "DESC")
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
    @comment = MindComment.new
    @comments = @mind.mind_comments.includes(:user)
  end
  
  def edit
    unless current_user.id == @mind.user_id
      redirect_to action: :index
    end
  end

  def update
    if @mind.update(mind_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @mind.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  def search
    @minds = Mind.search(params[:keyword]).order(id: "DESC")
  end

  private

  def mind_params
    params.require(:mind).permit(:text, :image).merge(user_id: current_user.id)
  end

  def mind
    @mind = Mind.find(params[:id])
  end
end
