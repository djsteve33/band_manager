class Venue < ApplicationRecord
    has_many :concerts
    has_many :users, through: :concerts
    validates :name, uniqueness: {case_sensitive: false}
    accepts_nested_attributes_for :concerts

    scope :alpha, -> { order(name: :asc)}

#     def self.find_by_user_id(id)
#     where(user_id: id)
#     end

#     def self.alpha_order
#     order(‘ASC’)
#     end

#     def concert_attributes(concert_attributes)
#     concert = Concert.find_or_create_by(concert_attributes)
#     self.concert = concert
#     save
#     end

end
