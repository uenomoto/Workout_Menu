class Admin::PostCommentsController < ApplicationController


  def index
    @post_comments = PostComment.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @post_comment = PostComment.find(params[:id])
  end

  def permember
    @user = User.find(params[:id])
    @post_comments = @user.post_comments.order(created_at: :desc).page(params[:page]).per(6)
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to admin_post_comments_path
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:user_id, :impression_id, :comment)
  end

end
