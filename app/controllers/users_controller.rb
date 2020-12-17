	class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:profile]
	
	def index
		# @connections =  Connection.where("sender_id = ? OR reciever_id = ?", current_user.id, current_user.id)
		# @friends = Array.new
		# @connections.each do |connection|
		# 	@friends << connection.find_friend_id(current_user.id.to_i)
		# end
		@friends = current_user.friends
		@friends << current_user
		@posts = Post.where(user_id: @friends)
		@post = Post.new
		@new_post = Post.new
		@comment = Comment.new
	end

	def profile
		# @connections =  Connection.where("sender_id = ? OR reciever_id = ?", params[:id], params[:id])
		# @friends = Array.new
		# @connections.each do |connection|
		# 	@friends << connection.find_friend_id(params[:id].to_i)
		# end
		@friends = @user.friends
		@friend_list = User.where(id: @friends)
		@post = Post.new
		@posts = Post.where(user_id: params[:id])
	end

	private

	def set_user
		@user = User.find(params[:id])
	end
end
