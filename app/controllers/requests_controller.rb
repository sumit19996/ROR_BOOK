class RequestsController < ApplicationController
	def new
		@request = Request.new(sender_id: current_user.id,reciever_id: request_params[:reciever_id] )
	end

	def create
		@request = Request.new(sender_id: current_user.id,reciever_id: params[:reciever_id] )
		byebug
		if @request.save
			flash[:success] = "Friend Request Sent"
			#redirect_to requests_path
		else
			redirect_back(fallback_location: root_path)
		end

	end
	def friend_request
	end
	def add_friend
		@users = User.where.not(id: current_user.id)
	end

	private
	def request_params
		params.require(:request).permit(:reciever_id)
	end
end
