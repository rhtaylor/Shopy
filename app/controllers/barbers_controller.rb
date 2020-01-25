class BarbersController < ApplicationController 
    helper_method :current_user, :logged_in?  
    def require_login
        return head(:forbidden) unless session.include? :customer_id
    end 
    
    def current_user
        @customer ||= Customer.find_by(id: session[:id])
    end
    
    def shop 
        session[:page] = 'home'
    end

    def index 
        session[:page] = 'barbers'
        @barbers = Barber.all
    end 
    def show 
        barber_id = session[:id] 
        @barber = Barber.find(barber_id)
    end
end
