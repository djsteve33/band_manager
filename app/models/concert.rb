class Concert < ApplicationRecord
    belongs_to :user
    belongs_to :venue
    accepts_nested_attributes_for :venue, reject_if :all_blank
    validates :band_name, :date, :start_time, presence: true
    scope :order_by_date, -> { order(date: :asc) }

    def venue_and_band_name
        "#{self.venue.name} - #{self.band_name}"
    end


end
