class VenuesController < ApplicationController
    before_action :set_concert
    before_action :set_venue, only: [:show]

    def new
    @venue = @concert.venues.new
    end

    def create
    @venue = current_user.@concert.venues.build(venue_params)
        if @venue.save
        redirect_to [@concert, @venue]
        else
        render :new
        end
    end

    def show
    @venue = Venue.find_by_id(params[:id])
    end

    def index
        @venuees = if params[:concert_id]
            Venue.find_by_concert_id(params[:concert_id].alpha_order
        else
            current_user.@concert.venues
        end
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
