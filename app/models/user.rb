class User < ApplicationRecord
    has_secure_password
    has_many :concerts
    has_many :venues, through: :concerts
    validates :username, uniqueness: true

    def self.from_omniauth(auth)
        find_or_create_by(username: auth[:info][:email]) do |user|
        user.pasword = SecureRandom.hex(15)
        end
    end
        
end
