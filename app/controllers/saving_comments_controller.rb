class SavingCommentsController < ApplicationController

  def create
    @comment = SavingComment.new(saving_comment_params)
    if @comment.save
      redirect_to saving_path(@comment.saving)
    else
      @saving = @comment.saving
      @comments = @saving.saving_comments
      render 'saving/show'
    end
  end

  private

  def saving_comment_params
    params.require(:saving_comment).permit(:content).merge(usre_id: current_user.id, saving_id: params[:saving_id])
  end
end
