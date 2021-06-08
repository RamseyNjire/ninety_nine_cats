class CatRentalRequest < ApplicationRecord
    STATUS_VALUES = ['PENDING', 'APPROVED', 'DENIED']

    validates_presence_of :start_date, :end_date, :status
    validates_inclusion_of :status, in: STATUS_VALUES

    belongs_to(
        :cat,
        class_name: 'Cat',
        foreign_key: :cat_id,
        primary_key: :id
    )
end
