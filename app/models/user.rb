class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_secure_password

  def add_friend(another_user)
    friends << another_user
  end 

  def is_friend?(another_user)
    friends.include?(another_user)
  end 





  

end
