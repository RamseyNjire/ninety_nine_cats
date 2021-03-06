# == Schema Information
#
# Table name: sessions
#
#  id               :bigint           not null, primary key
#  session_token    :string           not null
#  user_id          :integer          not null
#  operation_system :string
#  browser          :string
#  browser_version  :string
#
class Session < ApplicationRecord
    validates :user_id, presence: true
    validates :session_token, presence: true
    validates :session_token, uniqueness: true
    before_validation :ensure_session_token
    
    
    belongs_to(
        :user,
        class_name: "User",
        foreign_key: :user_id,
        primary_key: :id
    )


    def Session.generate_session_token
        begin
            token = SecureRandom::urlsafe_base64(16)
        end while Session.exists?(session_token: token)
        token
    end

    def reset_session_token
        session_token = Session.generate_session_token
        save!
        session_token
    end

    private

    def ensure_session_token
        self.session_token ||= Session.generate_session_token
    end
end
