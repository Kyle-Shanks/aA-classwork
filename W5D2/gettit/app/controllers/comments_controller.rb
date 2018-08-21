class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(@comment.post_id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post_id = @comment.post_id
    if @comment.author != current_user
      flash[:errors] = ["that ain't yo comment!"]
    else
      @comment.destroy
    end
    redirect_to post_url(post_id)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
