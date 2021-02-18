module ConcertsHelper

    def display_header
        if @venue 
            tag.h2("All the #{@venue.name} Conerts")
        else
            tag.h1("All the Concerts")
        end 
    end 

    def display_nested_header
        if params[:venue_id]
            "Create a new #{@venue.name} concert"
        else
            "Create New Concert"
        end 
    end 

end
