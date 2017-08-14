class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :recieved_messages, class_name: "Message", foreign_key: "recipient_id"
  has_secure_password
  

  def add_friend(another_user)
    friends << another_user
  end 

  def is_friend?(another_user)
    friends.include?(another_user)
  end 

  def self.except(user)
    where.not(id: user.id)
  end 

  def self.recipient_options(user)
    except(user).map {|e| [e.name, e.id]}
  end 





  

end
