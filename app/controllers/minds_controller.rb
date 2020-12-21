class MindsController < ApplicationController
  before_action :authenticate_user!, except: :index

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

  private

  def mind_params
    params.require(:mind).permit(:text, :image).merge(user_id: current_user.id)
  end
end
