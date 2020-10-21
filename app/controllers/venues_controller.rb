class VenuesController < ApplicationController
    before_action :set_concert
    before_action :set_venue, only: [:show]

    def show
    @venue = Venue.find_by_id(params[:id])
    end

    private

    def venue_params
    params.require(:venue).permit(:name, :city, :state, :capacity)
    end

    def set_concert
    @concert= Concert.find_by_id(params[:concert_id])
    end

    def set_venue
    @venue = @concert.venue.find_by_id(params[:id])
    end

end
