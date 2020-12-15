class Connection < ApplicationRecord
  belongs_to :sender, class_name: :User
  belongs_to :reciever, class_name: :User

	def find_friend_id(id)
		if sender_id == id
		  reciever_id
		else
		  sender_id
		end
	end
end
