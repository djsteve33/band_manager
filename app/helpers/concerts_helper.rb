module ConcertsHelper
<<<<<<< HEAD
=======

    def display_header
        if @venue 
            tag.h2("All the #{@venue.name} Concerts")
        else
            tag.h1("All the Concerts")
        end 
    end 

    def display_venue_fields(t)
        if params[:venue_id]
            t.hidden_field :venue_id
        else
            render partial: 'venue_select', locals: {f: t}
        end
    end

    def display_nested_header
        if params[:venue_id]
            "Create a new concert for #{@venue.name}"
        else
            "Create New Concert"
        end 
    end 

    def create_new_concert
        if @venue 
            link_to "Create a Concert", new_venue_concert_path(@venue)
        else
            link_to("Create Concert", new_concert_path)
        end
    end

>>>>>>> b72f5c006d94026be6ed4a2df801950a6684c337
end
