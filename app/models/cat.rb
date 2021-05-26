class Cat < ApplicationRecord
    require "action_view"
    include ActionView::Helpers::DateHelper


    ALLOWED_COLORS = ["black", "white", "brown", "yellow", "orange"]
    ALLOWED_SEXES = ["m", "f"]
    validates :birthdate, :color, :name, :sex, presence: true
    validates :name, uniqueness: true
    validates_length_of :sex, maximum: 1
    validates_inclusion_of :color, in: ALLOWED_COLORS
    validates_inclusion_of :sex, in: ALLOWED_SEXES


    def age
        time_ago_in_words(birthdate)
    end
end
