class ExercisesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :exercise, only: [:show, :edit, :update]

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
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def exercise_params
    params.require(:exercise).permit(:text, :image).merge(user_id: current_user.id)
  end

  def exercise
    @exercise = Exercise.find(params[:id])
  end
end
