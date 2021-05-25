class User < ApplicationRecord
<<<<<<< HEAD
=======
    has_secure_password
    has_many :concerts
    has_many :venues, through: :concerts

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    

    def self.create_from_omniauth(auth)
         User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
         u.username = auth['info']['first_name']
         u.email = auth['info']['email']
         u.password = SecureRandom.hex(12)
        end 
    end 
        
>>>>>>> b72f5c006d94026be6ed4a2df801950a6684c337
end
