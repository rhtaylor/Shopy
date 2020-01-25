class Barber < ApplicationRecord
  belongs_to :barber_shop
  has_many :appointments
  has_many :customers, through: :appointments
  has_many :haircuts 
  has_many :customers, through: :haircuts 
  accepts_nested_attributes_for :customers, :appointments, :haircuts
end
