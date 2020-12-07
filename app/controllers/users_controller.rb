class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:profile]
	def index
		@posts = Post.all
		@new_post=Post.new
	end
	def profile
		
	end

	def set_user
		@user =User.find(params[:id])
	end
end
