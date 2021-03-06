class EarliesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :early, only: [:show, :edit, :update, :destroy]

  def index
    @earlies = Early.all.order(id: "DESC")
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
    @comment = EarlyComment.new
    @comments = @early.early_comments.includes(:user)
  end

  def edit
    unless current_user.id == @early.user_id
      redirect_to action: :index
    end
  end

  def update
    if @early.update(early_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @early.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  def search
    @earlies = Early.search(params[:keyword]).order(id: "DESC")
  end

  private

  def early_params
    params.require(:early).permit(:text, :image).merge(user_id: current_user.id)
  end

  def early
    @early = Early.find(params[:id])
  end
end
