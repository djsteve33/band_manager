class Venue < ApplicationRecord
    has_many :concerts
    has_many :users, through: :concerts

    def self.find_by_user_id(id)
    where(user_id: id)
    end

end
