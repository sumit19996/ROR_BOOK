class Post < ApplicationRecord
	acts_as_votable
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :likes, dependent: :destroy
	validate :any_present?
	def any_present?
		if caption.blank? && image.blank?
		  errors[:base] << "Error message"
		end
	end
	def liked?(user)
		!!self.likes.find{|like| like.user_id == user.id}
	end
end
