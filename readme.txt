class barber shop 
has_many barbers 
has_many cutomvers through :barbers 

class admin 
has shop 
has many barbers 
has many customer through barbers 

class barber < admin  
belgons to shop
has many cutromers 
has many haircuts through customers 
table name, email, phone_number:access only by admin
foreign_key :shop_id  
    join_table haircut  
        type
        foreign_key customer 
        foreign_key barber
class customer < barber 
belongs_to barber
table name, phone_number, email, haircut 
foreign_key barber_id,  

class Haircut 
belongs_to customer 
table type, foreign_key customer
