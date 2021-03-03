class Concert < ApplicationRecord
    belongs_to :user
    belongs_to :venue
    #accepts_nested_attributes_for :venue
    validates :venue, :band_name, :date, :start_time, presence: true
    validates :venue, uniqueness: {scope: [:date, :start_time], message: 'already has that date and time combo'}
    scope :ordered_by_date, -> { order(date: :asc) }

    def venue_attributes=(attr)
        if !attr[:name].blank?
            self.venue = Venue.find_or_create_by(name: attr[:name], city: attr[:city], state: attr[:state], capacity: attr[:capacity])
        end
    end

    def concert_info
        "#{self.date} -  #{self.venue.name} - #{self.band_name} - #{self.start_time}"
    end


end
