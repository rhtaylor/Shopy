class Customer < ApplicationRecord  
    
    attr_accessor :uid

    has_secure_password
    has_many :appointments 
    has_many :barbers, through: :appointments 
    has_many :haircuts 
    has_many :barbers, through: :haircuts 
    
    validates :name, presence: true
    validates :email, :phone_number, presence: true, uniqueness: true 
    accepts_nested_attributes_for :barbers, :haircuts, :barbers 

    before_create :set_slug  
  
    def to_param  
        
        slug
        
    end 

    def self.find_by_slug(params)
        Article.where('slug' == params['slug']).first
    end 

    private 

     def set_slug
    
      self.slug = SecureRandom.uuid
      
     end 

end
