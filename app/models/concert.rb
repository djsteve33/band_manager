class Concert < ApplicationRecord
    belongs_to :user
    belongs_to :venue
#     #accepts_nested_attributes_for :venues, reject_if :all_blank
    validates :band_name, :date, :start_time, presence: true
    
    scope :order_by_date -> { order(:date 'asc')}

end
