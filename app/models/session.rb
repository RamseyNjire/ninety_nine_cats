# == Schema Information
#
# Table name: sessions
#
#  id            :bigint           not null, primary key
#  session_token :string           not null
#  user_id       :integer          not null
#
class Session < ApplicationRecord
    validates :user_id, presence: true
    validates :session_token, presence: true
    
    
    belongs_to(
        :user,
        class_name: "User",
        foreign_key: :user_id,
        primary_key: :id
    )


    def Session.generate_session_token
        SecureRandom::urlsafe_base64(16)
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
