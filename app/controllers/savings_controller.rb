class SavingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :saving, only: [:show, :edit, :update, :destroy]

  def index
    @savings = Saving.all.order(id: "DESC")
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

  def show
    @comment = SavingComment.new
    @comments = @saving.saving_comments.includes(:user)
  end

  def edit
    unless current_user.id == @saving.user_id
      redirect_to action: :index
    end
  end

  def update
    if @saving.update(saving_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @saving.destroy
      redirect_to action: :index
    else
      render :show
    end
  end
  
  def search
    @savings = Saving.search(params[:keyword])
  end
  
  private

  def saving_params
    params.require(:saving).permit(:text, :image).merge(user_id: current_user.id)
  end

  def saving
    @saving = Saving.find(params[:id])
  end
end
