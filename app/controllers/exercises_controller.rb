class ExercisesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    @exersice = Exercise.find(params[:id])
  end

  private

  def exercise_params
    params.require(:exercise).permit(:text, :image).merge(user_id: current_user.id)
  end
end
