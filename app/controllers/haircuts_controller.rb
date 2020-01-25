require 'date' 
require 'time'
class HaircutsController < ApplicationController 
     helper_method :current_user, :logged_in?

  def current_user
    @customer ||= Customer.find_by(id: session[:id])
  end

  def logged_in?
    current_user != nil
  end 
    def index 
        @ordered = Haircut.schedule
    end
    def new  
        if session[:customer_id] 
            id = session[:customer_id] 
            @customer = Customer.find(id) 
        
        end
      
    end 

    def create  
        date = params[:haircut][:date] 
        ad = date.to_time.strftime("%A, %b %e, at %l:%M %p")
        savable_date = date.to_time
        
        date
        barber = Barber.find_by(name: params[:haircut][:barber]) 
        style = params[:haircut][:style]
        customer_id = params[:haircut][:customer_id]
        @haircut = Haircut.create(style: style, date: savable_date , barber_id: barber.id, customer_id: customer_id) 
        if @haircut.valid?
            session[:id] = params[:haircut][:customer_id]
            redirect_to haircut_path(@haircut) 
            
        else 
            binding.pry
        end

    end 

    def show 
        session[:page] = 'scheduled'
        @haircut = Haircut.find(params[:id]) 
        @barber = Barber.find(@haircut.barber_id) 
        
    end
    private 

    def safe_params(*args) 
        date = params[:haircut][:date].split(' ').join('')
        barber = Barber.find_by(name: params[:haircut][:barber]) 
        params.require('haircut').permit(:style, :customer_id)
    end
end
