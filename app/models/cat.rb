# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birthdate   :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    require "action_view"
    include ActionView::Helpers::DateHelper


    ALLOWED_COLORS = ["black", "white", "brown", "yellow", "orange"]
    ALLOWED_SEXES = ["M", "F"]
    validates :birthdate, :color, :name, :sex, presence: true
    validates :name, uniqueness: true
    validates_length_of :sex, maximum: 1
    validates_inclusion_of :color, in: ALLOWED_COLORS
    validates_inclusion_of :sex, in: ALLOWED_SEXES

    has_many(
        :cat_rental_requests,
        class_name: 'CatRentalRequest',
        foreign_key: :cat_id,
        primary_key: :id,
        dependent: :destroy
    )


    def age
        time_ago_in_words(birthdate)
    end
end
