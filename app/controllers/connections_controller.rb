class ConnectionsController < ApplicationController

	def create
		@connection = Connection.new(sender_id: params[:sender_id],reciever_id: current_user.id )
		if @connection.save
			@req = Request.find_by_id(params[:request_id])
			@req.status = 1
			@req.save
			flash[:success] = "Friend Request Accepted"
			#redirect_to requests_path
		else
			redirect_back(fallback_location: root_path)
		end
	end
	def friend_request
		@requests = Request.pending.where(reciever_id: current_user.id)
	end

end
