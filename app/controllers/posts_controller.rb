class PostsController < ApplicationController

	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id if user_signed_in?
		if @post.save
			redirect_to home_path
		else
			redirect_to new_post_path, { flash: "Post created Successfully"}
		end
	end
	def show

	end
	private
	def post_params
		params.require(:post).permit(:image,:image_cache,:caption)
	end
end