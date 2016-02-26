class User < ActiveRecord::Base
  has_many :workouts
  has_secure_password


  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :username, :presence => true

  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }

  validates :password, :presence => true, allow_nil: true
  validates :dob, presence: true


end
