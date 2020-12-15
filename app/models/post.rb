class Post < ApplicationRecord
	default_scope {order(created_at: :desc)}
	acts_as_votable
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :likes
	has_many :comments
	validate :any_present?
	
	def any_present?
		if caption.blank? && image.blank?
		  errors[:base] << "Error message"
		end
	end
	
	def liked?(user)
		!!self.likes.find{|like| like.user_id == user.id}
	end
	def like(user)
		like = self.likes.find{|like| like.user_id == user.id}
		like.id
	end
	def likes_count
		self.likes.count
	end
end
