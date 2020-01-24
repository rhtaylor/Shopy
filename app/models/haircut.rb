class Haircut < ApplicationRecord  
    validates :style, :barber, presence: true 
    validates_associated :barber, presence: true
    validates_associated :customer, presence: true
    validates :date, format: { with: /[0-9][0-9][0-9][0-9]\-[0-3][0-9]\-[0-9][0-9]\s[0-9]{2}[,-:][0-9]{2}?/, message: 'must be in yyyy/mm/yy hr:mn format'  }
    belongs_to :customer 
    belongs_to :barber 

    accepts_nested_attributes_for :customer, :barber

end
