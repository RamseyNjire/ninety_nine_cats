class CatRentalRequestsController < ApplicationController

    def new
        @cat_rental_request = CatRentalRequest.new
        @status_values = CatRentalRequest::STATUS_VALUES
        render :new
    end

    def create
        cat_rental_request = CatRentalRequest.new(cat_rental_request_params)

        if cat_rental_request.save
            render plain: "New request created!"
        else
            render :new
        end
    end

    def approve
        cat_rental_request = CatRentalRequest.find_by(id: params[:id])
        cat_rental_request.approve!
    end

    def deny
        cat_rental_request = CatRentalRequest.find_by(id: params[:id])
        cat_rental_request.deny!
    end

    private

    def cat_rental_request_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
    end
end
