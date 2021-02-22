module ConcertsHelper

    def display_header
        if @venue 
            tag.h2("#{@venue.name}'s Concerts")
        else
            tag.h1("All the Concerts")
        end 
    end 

    def display_venue_fields(t)
        if params(:venue_id)
            t.hidden_field :venue_id
        else
            render partial: 'venue_select', locals: (f: t)
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
