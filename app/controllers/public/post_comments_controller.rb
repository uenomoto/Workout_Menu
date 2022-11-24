class Public::PostCommentsController < ApplicationController
    
    
    private
  
  def post_comment_params
    params.require(:post_comment).permit(:user_id, :impression_id, :comment)
  end
  
end
