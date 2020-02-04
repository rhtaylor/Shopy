class BarbersController < ApplicationController 
    helper_method :current_user, :logged_in?  
   
     def shop 
        session[:page] = 'home'
    end


    def index  
        
        session[:page] = 'barbers' 
        @session = session 
        session[:customer_id] = session[:id]
        @barbers = Barber.all
    end 
    def show   
        
        barber_slug = params[:slug]  
        @customer = current_user 
        @appointment = @customer.appointments.build
        @barber = Barber.find_by(slug: barber_slug)
    end
end
