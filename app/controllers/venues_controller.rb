class VenuesController < ApplicationController
#     before_action :set_concert, only: [:show, :update, :edit, :destroy]
      # before_action :set_venue, only: [:show, :update, :edit, :destroy]
      before_action :redirect_if_not_logged_in

      def new
            if params[:user_id] && @user = User.find_by_id(params[:user_id])
                  @venue = @user.venues.build
            else
                  @venue = Venue.new
            end
      end

      def index
            if params[:user_id] && @user = User.find_by_id(params[:user_id])
                  @venues = @user.venues.alpha
            else
                  @error = "That user doen't exist" if params[:user_id]
            end
      end     


    def create
    @venue = current_user.venues.build(venue_params)
        if @venue.save
        redirect_to venues_path
        else
        render :new
        end
    end

    def edit
      @venue = Venue.find_by_id(params[:id])
      redirect_to venues_path if !@venue || @venue.user !=current_user
    end

    def update
      @venue = Venue.find_by(id: params[:id])
      redirect_to venues_path if !@venue || @venue.user !=current_user
      if @venue.update(venue_params)
            redirect_to venue_path(@venue)
      else
            render :edit
      end
    end

    
      def show
      @venue = Venue.find_by_id(params[:id])
      redirect_to venue_path(@venue) if !@venue
      end

      def destroy
      @venue.destroy
      redirect_to venues_path
      end



    private

    def venue_params
    params.require(:venue).permit(:name, :city, :state, :capacity)
    end

#     def set_concert
#     @concert= Venue.find_by_id(params[:id])
#     end

    def set_venue
    @venue = Venue.find_by(id: params[:id])
    end

end
