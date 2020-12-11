class RequestsController < ApplicationController
	def new
		@request = Request.new(sender_id: current_user.id,reciever_id: request_params[:reciever_id] )
	end

	def create
		@request = Request.new(sender_id: current_user.id,reciever_id: params[:reciever_id] )
		if @request.save
			flash[:success] = "Friend Request Sent"
			#redirect_to requests_path
		else
			redirect_back(fallback_location: root_path)
		end
	end
	def update
		@req = Request.find_by_id(params[:request_id])
		@req.status = 2
		if @req.save
			flash[:success] = "Friend Request Rejected"
		else
			redirect_back(fallback_location: root_path)
		end
	end
	def add_friend
		@connections = Connection.where(sender_id: current_user.id).or(Connection.where(reciever_id: current_user.id))
		@friends = Array.new
		@connections.each do |connection|
			@friends << connection.find_friends(current_user.id)
		end
		@friends << current_user.id
		@users = User.where.not(id: @friends)
		@requests = Request.pending.where(sender_id: current_user.id)
	end
	def destroy
		@request = Request.find(params[:id])
		@request.destroy
	end
	private
	def request_params
		params.require(:request).permit(:reciever_id)
	end
end
