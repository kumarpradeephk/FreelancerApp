class User < ApplicationRecord
	has_many :projects
	before_save {self.email = email.downcase}
	validates :username, presence: true, uniqueness: { case_sensitive: false},
				length: {minimum: 3,maximum: 20}
	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, case_sensitive: false, length: {maximum: 105},
				format: { with: VALID_EMAIL_REGEX }

	validates :category, presence:true
	has_secure_password
	has_secure_token
end
