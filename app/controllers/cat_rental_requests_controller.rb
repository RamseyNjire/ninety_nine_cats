class CatRentalRequestsController < ApplicationController

    def new
        @cat_rental_request = CatRentalRequest.new
        @status_values = CatRentalRequest::STATUS_VALUES
        render :new
    end
end
