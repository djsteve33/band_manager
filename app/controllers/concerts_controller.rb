class ConcertsController < ApplicationController
    #before_action :redirect_if_not_logged_in
    # before_action :set_concert, only: [:show, :edit, :update, :destroy]
    layout 'concert'
    before_action :find_concert, :redirect_if_not_band_manager, only: [:show, :edit, :update, :destroy]
 
    def index      
        if params[:venue_id] && @venue = Venue.find_by_id(params[:venue_id])
            @concerts = @venue.concerts.ordered_by_date
        else
            @error = "That venue doesn't exist" if params[:venue_id]
            @concerts = Concert.ordered_by_date
        end        
    end

    def show
        @concert = Concert.find(params[:id])
        
    end

    def new
        if params[:venue_id] && @venue = Venue.find_by_id(params[:venue_id])
            @concert = @venue.concerts.build
        else
            #@error = "That venue doesn't exist" if params[:venue_id]
            @concert = Concert.new
            @concert.build_venue
        end
    end

    def create
        @concert = current_user.concerts.build(concert_params) 
        if @concert.save
            redirect_to concert_path(@concert)
        else
            @venue = Venue.find_by_id(params[:id]) if params[:venue_id] != ""
            render :new
        end
    end

    def edit
    end

    def update
        @concert = Concert.find(params[:id])
        if @concert.update(concert_params)
            redirect_to concert_path(@concert)
        else
            render :edit
        end    
    end

    def destroy
        concert = Concert.find(params[:id])
        concert.destroy
        redirect_to concerts_path
    end

    private

    def concert_params
        params.require(:concert).permit(:venue_id, :band_name, :date, :start_time,venue_attributes: [:name, :city, :state, :capacity])
    end

    def set_concert
        @concert = Concert.find_by(id: params[:id])
        if !@concert
            flash[:message] = "Concert was not found"
            redirect_to concerts_path
        end
    end

    def find_concert
        @concert = Concert.find(params[:id])
    end

    def redirect_if_not_band_manager
        if @concert.user != current_user
            redirect_to user_path(current_user), alert: "You can't edit this concert!"
        end
    end


end


