class User < ActiveRecord::Base
  before_save :encrypt_password

  attr_accessor :password

  attr_accessible :email, :name, :password, :password_confirmation

  validates :name,
    :presence => true

  validates :email,
    :presence => true,
    :uniqueness => true

  validates :password,
    :presence => true ,
    :confirmation => true,
    :length => {:minimum => 5},
    :on => :create
 

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine::generate_salt
      self.password_hash = BCrypt::Engine::hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine::hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end