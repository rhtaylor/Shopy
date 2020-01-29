require 'date' 
require 'time'
class HaircutsController < ApplicationController 
     helper_method :current_user, :logged_in?

 

  def filter 
     
        if  params.keys.include?("slug") && !(params[:customer].empty?) 
            @one = Haircut.mycuts(current_user)  
            @two = Haircut.where(customer_slug: params[:customer])
            @selected = @one.to_a + @two 

        elsif params.keys.include?("slug") && params[:customer].empty?
            @selected = Haircut.mycuts(current_user)  
            
        elsif 
            @id = params[:customer] 
            @customer = Customer.find(@id)
            @selected = Haircut.mycuts(@customer)
        end
     render :index
  end 
  
    def index 
        
        session[:slug] = session[:customer_slug] 
        @session = session 
        
        @selected = Haircut.schedule
    end 

     
    
    def new   
        
        session[:page] = 'new haircut' 
        session[:slug] = session[:customer_slug]  
        
        
        if session[:customer_slug] 
            slug = session[:customer_slug] 
            @customer = Customer.find_by(slug: slug) 
        
        end
      
    end 

    def create 
    
        
        date_time = params[:datetime].values 
        
        dat = date_time[0..2].join("-") 
        date = dat += " "
        time = date_time[3, 4].join(":") 
        date_ready = date += time 
        barber = Barber.find_by(name: params[:haircut][:barber]) 
        style = params[:haircut][:style]
        customer_id = session[:customer_id] 
        binding.pry
        @haircut = Haircut.create(style: style, date: date_ready , barber_id: barber.id, customer_id: customer_id) 
        if @haircut.valid?
            session[:slug] = params[:haircut][:customer_slug]
            redirect_to haircut_path(@haircut) 
            
        else 
            binding.pry 
            #add error handling here
        end

    end 

    def show 
        
        @customer = current_user 
        session[:customer_id] = @customer.id 
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
