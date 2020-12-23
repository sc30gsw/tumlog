class EarlyCommentsController < ApplicationController

  def create
    @comment = EarlyComment.new(early_comment_params)
    if @comment.save
      redirect_to early_path(@comment.early)
    else
      @early = @commnet.early
      @commnets = @early.early_comments
      render 'early/show'
    end
  end

  private

  def early_comment_params
    params.require(:early_comment).permit(:content).merge(user_id: current_user.id, early_id: params[:early_id])
  end
end
