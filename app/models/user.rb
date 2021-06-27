class User < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 20}
    REGEX_FORM = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}, format: {with: REGEX_FORM}
    has_secure_password
end
