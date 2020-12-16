class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes
  has_many :comments

  has_many :senders, foreign_key: "sender_id", class_name: "Request" 
  has_many :recievers, foreign_key: "reciever_id", class_name: "Request"

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
end
