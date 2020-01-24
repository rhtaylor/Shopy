class Customer < ApplicationRecord  
    has_secure_password
    has_many :appointments 
    has_many :barbers, through: :appointments 
    has_many :haircuts 
    has_many :barbers, through: :haircuts 
    
     
    validates :name, :email, :phone_number, presence: true, uniqueness: true
end
