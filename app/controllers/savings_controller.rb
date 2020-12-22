class SavingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :saving, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
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
  
  private

  def saving_params
    params.require(:saving).permit(:text, :image).merge(user_id: current_user.id)
  end

  def saving
    @saving = Saving.find(params[:id])
  end
end
