class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.valid?
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:text, :image).merge(user_id: current_user.id)
  end
end
