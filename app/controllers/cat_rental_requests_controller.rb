class CatRentalRequestsController < ApplicationController

    def new
        @cat_rental_request = CatRentalRequest.new
        @status_values = CatRentalRequest::STATUS_VALUES
        render :new
    end

    def create
        request = CatRentalRequest.new(cat_rental_request_params)

        if request.save
            render plain: "New request created!"
        else
            render :new
        end
    end

    private

    def cat_rental_request_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
    end
end