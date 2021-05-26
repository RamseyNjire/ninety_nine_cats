class Cat < ApplicationRecord
    ALLOWED_COLORS = ["black", "white", "brown", "yellow", "orange"]
    ALLOWED_SEXES = ["m", "f"]
    validates :birthdate, :color, :name, :sex, presence: true
    validates_inclusion_of :color, in: ALLOWED_COLORS
    validates_inclusion_of :sex, in: ALLOWED_SEXES
end
