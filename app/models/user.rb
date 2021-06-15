# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    attr_reader :password
    validates :username, presence: true
    validates :username, uniqueness: { message: "Username must be unique" }
    validates :password_digest, presence: { message: "^Password cannot be blank" }
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :password_confirmation, presence: { message: "^Please confirm your password" }
    validates :password, confirmation: { message: "^Passwords should match" }



    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def generate_token
end
