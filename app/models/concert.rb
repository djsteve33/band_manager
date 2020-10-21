class Concert < ApplicationRecord
    belongs_to :user
    belongs_to :venue
    accepts nested_attributes_for :venue, reject_if :all_blank
    validates :band_name, presence: true
    vaildates :date, presence: true
    vaildates :start_time, presence: true
end
