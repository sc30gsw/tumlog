class LearnCommentsController < ApplicationController
  
  def create
    @comment = LearnComment.new(learn_comment_params)
    if @comment.save
      redirect_to learn_path(@comment.learn)
    else
      @learn = @comment.learn
      @comments = @learn.learn_comments
      render 'learn/show'
    end

    private

    def learn_comment_params
      params.require(:learn_comment).permit(:content).merge(user_id: current_user.id, learn_id: params[:learn_id])
    end
  end
end
