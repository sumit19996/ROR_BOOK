class CommentsController < ApplicationController
	before_action :authenticate_user!
	
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(post_id: params[:post_id],user_id:current_user.id,content:comment_params[:content])
		#redirect_back(fallback_location: root_path)
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end