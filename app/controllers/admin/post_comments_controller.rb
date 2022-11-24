class Admin::PostCommentsController < ApplicationController
  def index
  end

  def show
  end
  
  
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:user_id, :impression_id, :comment)
  end
  
end
