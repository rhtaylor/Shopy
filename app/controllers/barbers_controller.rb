class BarbersController < ApplicationController 
    
    
    def shop 
        session[:page] = 'home'
    end

    def index 
        session[:page] = 'barbers'
        @barbers = Barber.all
    end
end
