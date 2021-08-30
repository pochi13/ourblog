class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/blogs/#{comment.blog.id}"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @blog = @comment.blog
    @comment.destroy
    redirect_to blog_path(@blog)
  end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, blog_id: params[:blog_id])
  end
end
