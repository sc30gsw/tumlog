class MindCommentsController < ApplicationController
  
  def create
    @comment = MindComment.new(mind_comment_params)
    if @comment.save
      redirect_to mind_path(@comment.mind)
    else
      @mind = @comment.mind
      @comments = @mind.mind_comments
      render 'minds/show'
    end
  end

  private

  def mind_comment_params
    params.require(:mind_comment).permit(:content).merge(user_id: current_user.id, mind_id: params[:mind_id])
  end
end
