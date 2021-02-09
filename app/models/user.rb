class User < ApplicationRecord
#     has_secure_password
#     has_many :concerts
#     has_many :venues, through: :concerts
#     validates :username, presence: true
#     validates :username, uniqueness: true

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
         u.username = auth['info']['first_name']
         u.email = auth['info']['email']
         u.password = SecureRandom.hex(12)
        end 
    end 
        
end
