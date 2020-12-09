class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes
  mount_uploader :image, ImageUploader
  mount_uploader :cover_image, ImageUploader
  def full_name
  	"#{first_name} #{last_name}"
  end

end
