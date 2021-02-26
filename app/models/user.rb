class User < ApplicationRecord
    has_secure_password
    has_many :concerts
    has_many :venues, through: :concerts

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    #validates :password, length: { in: 5..10 }

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
         u.username = auth['info']['first_name']
         u.email = auth['info']['email']
         u.password = SecureRandom.hex(12)
        end 
    end 
        
end
