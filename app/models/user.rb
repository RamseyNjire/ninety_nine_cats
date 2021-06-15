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
    before_validation :ensure_session_token
    validates :username, presence: true
    validates :username, uniqueness: { message: "^Username must be unique" }
    validates :password_digest, presence: { message: "^Password cannot be blank" }
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :password_confirmation, presence: { message: "^Please confirm your password" }, on: :create
    validates :password, confirmation: { message: "^Passwords should match" }
    validates :session_token, presence: true

    has_many(
        :cats,
        class_name: "Cat",
        foreign_key: :user_id,
        primary_key: :id,
        dependent: :destroy
    )



    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def User.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?

        user.is_password?(password) ? user : nil
    end

    def User.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token
        session_token = User.generate_session_token
        save!
        session_token
    end

    private

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end
end
