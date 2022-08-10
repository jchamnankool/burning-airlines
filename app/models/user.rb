class User < ApplicationRecord
    has_secure_password
    validates :email, :uniqueness => true, :presence => true
    has_many :reservations
    has_many :flights, :through => :reservations
end
