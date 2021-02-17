class VenuesController < ApplicationController
#     before_action :set_concert, only: [:show, :update, :edit, :destroy]
#     before_action :set_venue, only: [:show, :update, :edit, :destroy]
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


#     def create
#     @venue = current_user.@concert.venues.build(venue_params)
#         if @venue.save
#         redirect_to [@concert, @venue]
#         else
#         render :new
#         end
#     end

#     def show
#     @venue = Venue.find_by_id(params[:id])
#     end

#    

#     private

#     def venue_params
#     params.require(:venue).permit(:name, :city, :state, :capacity)
#     end

#     def set_concert
#     @concert= Venue.find_by_id(params[:id])
#     end

#     def set_venue
#     @venue = .find_by_id(params[:id])
#     end

end
