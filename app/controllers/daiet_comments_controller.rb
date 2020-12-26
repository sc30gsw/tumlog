class DaietCommentsController < ApplicationController

  def create
    @comment = DaietComment.new(daiet_comment_params)
    if @comment.save
      redirect_to daiet_path(@comment.daiet)
    else
      @daiet = @comment.daiet
      @comments = @daiet.daiet_comments
      render 'daiets/show'
    end
  end

  private

  def daiet_comment_params
    params.require(:daiet_comment).permit(:content).merge(user_id: current_user.id, daiet_id: params[:daiet_id])
  end

end