class PostsController < ApplicationController
	before_action :authenticate_user!
	
	respond_to :js,:json, :html
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id if user_signed_in?
		if @post.save
			redirect_back(fallback_location: root_path)
		else
			flash[:error] = "Both Caption and Image Can't be Blank"
			redirect_back(fallback_location: root_path)
		end
	end
	def show
	end

	def like
		@post = Post.find(params[:id])
		if params[:format] == 'like'
			@post.liked_by current_user
		elsif 
			@post.unliked_by current_user
		end
			
		#Like.create(post_id: params[:post_id], user_id:current_user.id)
		#redirect_to post_path(@post)
	end
	def vote
		if !current_user.liked? @post
			@post.liked_by current_user
		elsif current_user.liked? @post
			@post.unliked_by current_user
		end
	end
	

	private
	def post_params
		params.require(:post).permit(:image,:image_cache,:caption)
	end
end