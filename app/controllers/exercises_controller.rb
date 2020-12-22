class ExercisesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.valid?
      @exercise.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @exercise.user_id
      redirect_to action: :index
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @exercise.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:text, :image).merge(user_id: current_user.id)
  end

  def exercise
    @exercise = Exercise.find(params[:id])
  end
end
