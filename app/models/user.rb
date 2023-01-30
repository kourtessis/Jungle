# class User < ApplicationRecord
class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 4}, confirmation: true
  validates :password_confirmation, presence: true, length: {minimum: 4}
  before_save :sanitize_email

  def self.authenticate_with_credentials(email, password)
    email.downcase!
    email.strip!
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else 
      return
    end
  end

  def sanitize_email
    self.email.downcase!
    self.email.strip!
  end
end
