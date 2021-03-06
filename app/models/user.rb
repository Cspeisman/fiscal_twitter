require 'bcrypt'
class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy  
  include BCrypt

  validates :password, presence: true
  validates :username, presence: true

   def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
end
