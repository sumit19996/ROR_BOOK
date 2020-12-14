class LikesController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.likes.create(post_id: params[:post_id],user_id:current_user.id)	
	end


end