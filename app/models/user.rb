class User < ApplicationRecord
    has_secure_password
    has_many :concerts
    has_many :venues, through: :concerts
    validates :username, uniqueness: true
end
