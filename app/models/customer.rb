class Customer < ApplicationRecord  
    
    attr_accessor :uid

    has_secure_password
    has_many :appointments 
    has_many :barbers, through: :appointments 
    has_many :haircuts 
    has_many :barbers, through: :haircuts 
    
     
    validates :name, :email, :phone_number, presence: true, uniqueness: true 
    accepts_nested_attributes_for :barbers, :haircuts, :barbers
end
