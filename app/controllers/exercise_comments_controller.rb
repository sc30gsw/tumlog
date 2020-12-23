class ExerciseCommentsController < ApplicationController

  def create
    @comment = ExerciseComment.new(exercise_comment_params)
    if @comment.save
      redirect_to exercise_path(@comment.exercise)
    else
      @exercise = @comment.exercise
      @comments = @exercise.exercise_comments
      render 'exercise/show'
    end
  end

  private
  
  def exercise_comment_params
    params.require(:exercise_comment).permit(:content).merge(user_id: current_user.id, exercise_id: params[:exercise_id])
  end
end
