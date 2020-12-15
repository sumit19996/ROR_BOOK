class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes
  has_many :comments
  has_many :senders, foreign_key: "sender_id", class_name: "Connection" 
  has_many :reciever_friends, through: :senders, source: :reciever
  has_many :recievers, foreign_key: "reciever_id", class_name: "Connection"
  has_many :sender_friends, through: :recievers, source: :sender

  mount_uploader :image, ImageUploader
  mount_uploader :cover_image, ImageUploader
  
  def full_name
  	"#{first_name} #{last_name}"
  end
  
  def friends
    (sender_friends + reciever_friends).uniq
  end

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
