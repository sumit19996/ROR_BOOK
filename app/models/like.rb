class Like < ApplicationRecord
	belongs_to :post
	belongs_to :user

	def user
		User.with_deleted.find(user_id)
	end
end