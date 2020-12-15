class LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post
	def create
		@like = @post.likes.create(post_id: params[:post_id],user_id:current_user.id)	
	end

	def destroy
		@like = @post.likes.find(params[:id])
		@like.destroy
	end

	private
	def set_post
		@post = Post.find(params[:post_id])
	end
end