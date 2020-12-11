class Connection < ApplicationRecord

	def find_friends(id)
		if sender_id == id
			return reciever_id
		else
			return sender_id
		end
	end
end
