class CatRentalRequest < ApplicationRecord
    STATUS_VALUES = ['PENDING', 'APPROVED', 'DENIED']

    validates_presence_of :start_date, :end_date, :status
    validates_inclusion_of :status, in: STATUS_VALUES
    validate :does_not_overlap_approved_request

    belongs_to(
        :cat,
        class_name: 'Cat',
        foreign_key: :cat_id,
        primary_key: :id
    )

    def overlapping_requests
        CatRentalRequest.where.not('id = ?', self.id).where('cat_id = ? AND end_date >= ?', self.cat_id, self.start_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where('status = ?', 'APPROVED')
    end

    private

    def does_not_overlap_approved_request
        unless overlapping_approved_requests.empty?
            errors[:base] << "There are overlapping requests for this cat. Try a different start date"
        end
    end
end
