This was created prior to making the application. This was not followed out exactly but it was only a guideline.
class BarberShop 
has_many barbers 
has_many cutomvers through :barbers 

class Barber   
belongs_to shop
has many haircuts 
has many customers through: :customers  

class Haircut 
has_many :customers 
has_many :barbers

    join_table haircuts  
        type
        foreign_key customer 
        foreign_key barber 

class customer
belongs_to barber

    table customers
        phone_number, email, haircut 

<%= render partial: 'partial/cut', locals: {@customer: current_user } %> 
<%= render partial: "authors/author", locals: {post_author: @author} %>