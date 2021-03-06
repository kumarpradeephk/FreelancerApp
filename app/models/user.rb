class User < ApplicationRecord
	has_many :projects
	has_many :applied_user_completion_details
	before_save {self.email = email.downcase}
	VALID_USERNAME_REGEX = /\A^[a-z0-9_-]{3,15}$\z/i
	validates :username, presence: true, uniqueness: { case_sensitive: false},
				length: {minimum: 3,maximum: 15}, format: { with: VALID_USERNAME_REGEX }
	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, case_sensitive: false, length: {maximum: 105},
				format: { with: VALID_EMAIL_REGEX }

	validates :category, :username, :email, :password_digest, presence:true
	validates :password, presence: true, length: {minimum: 3}
	
	has_secure_password
	has_secure_token

	enum category: {work: 0, hire: 1}
end
