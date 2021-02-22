class Concert < ApplicationRecord
    belongs_to :user
    belongs_to :venue
    accepts_nested_attributes_for :venue, reject_if :all_blank
    validates :band_name, :date, :start_time, presence: true
    scope :order_by_date, -> { order(date: :asc) }

    def concert_info
        "#{self.date} -  #{self.venue.name} - #{self.band_name} - #{self.start_time}"
    end


end
