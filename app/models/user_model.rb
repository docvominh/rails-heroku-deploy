class UserModel < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  before_save :encrypt_password
  #has_secure_password

  #paperclip
  #has_attached_file :img_url, styles: {medium: '300x300>', thumb: '100x100>'}, default_url: '/assets/missing.png'
  #validates_attachment :img_url, {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :user_id, :presence => true,
            :length => 6..50

  validates :user_name, :presence => true,
            :length => 6..100

  validates :email, :presence => true,
            :length => 6..100,
            :format => email_regex

  validates :password, :presence => true,
            :length => 6..100,
            :on => create

  def self.authenticate(user_id, password)
    user = UserModel.where(user_id: user_id).first
    if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_digest = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
