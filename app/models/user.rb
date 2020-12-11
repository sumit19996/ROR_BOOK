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
  #after_commit :add_default_image, on: [:create]

  private
  def add_default_image
    if self.gender = "Male"
      self.image.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'male.jpg'
            )
          ), filename: 'default-image.jpg',
          content_type: 'image/jpg'
        )
    elsif self.gender = "Female"
      self.image.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'female.jpg'
            )
          ), filename: 'default-image.jpg',
          content_type: 'image/jpg'
        )    end   
  end
end
