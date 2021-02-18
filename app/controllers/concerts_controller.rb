class ConcertsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_concert, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_concert_manager, only: [:edit, :update]
 
    def index
        if params[:venue_id] && @venue = Venue.find_by_id(params[:venue_id])
            @concerts = @venue.concerts.order_by_date
        else
            @error = "That venue doesn't exist" if params[venue_id]
            @concert = Concert.all
        end        
    end

    def show
    end

    def new
        if params[:venue_id] && @venue = Venue.find_by_id(params[:venue_id])
            @concerts = @venue.concerts.build
        else
            @error = "That venue doesn't exist" if params[venue_id]
            @concert = Concert.new
        end
    end

    def create
        @concert = current_user.concerts.build(concert_params)        
        if @concert.save
            redirect_to concerts_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @concert.update(concert_params)
            redirect_to concert_path(@concert)
        else
            render :edit
        end    
    end

    def destroy
        concert.destroy
        redirect_to concerts_path
    end

    private

    def concert_params
        params.require(:concert).permit(:band_name, :date, :start_time)
    end

    def set_concert
        @concert = Concert.find_by(id: params[:id])
        if !@concert
            flash[:message] = "Concert was not found"
            redirect_to concerts_path
        end
    end

    def redirect_if_not_concert_manager
        redirect_to concerts_path if @concert.user != current_user
    end


end


