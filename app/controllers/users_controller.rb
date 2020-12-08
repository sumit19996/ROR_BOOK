class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:profile]
	def index
		@post = Post.new
		@posts = Post.all
		@new_post=Post.new
		@like_exists = Like.where(post: @post, user:current_user) == [] ? false : true
	end
	def profile
		
	end

	def set_user
		@user =User.find(params[:id])
	end
end
