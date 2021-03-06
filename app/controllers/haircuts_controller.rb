require 'date' 
require 'time'
class HaircutsController < ApplicationController 
     helper_method :current_user, :logged_in?, :pull_date, :pull_barber_id, :pull_customer_id, :process_data

 

  def filter 
            
        if  params.keys.include?("id") && !(params[:customer].empty?)  
            
            @one = Haircut.mycuts(current_user)  
            @two = Haircut.where(customer_id: params[:customer])
            @selected = @one.to_a + @two 

        elsif params.keys.include?("id") && params[:customer].empty?
            
            @selected = Haircut.mycuts(current_user)
            
        elsif   
            
           @selected = Haircut.where(customer_id: params[:customer])
           
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
        
        params["generic"] = {}
        params["haircut"].each_pair{ |x,y| params["generic"][x] = y } 
        
        process_data
        @haircut = Haircut.create(safe_params)   
        
        if @haircut.valid?
            session[:slug] = params[:haircut][:customer_slug] 
            
            redirect_to  customer_haircut_path(@customer, @haircut) 
        else   
            @alert = @haircut.errors
            flash["message"] = "One or more problems"
            flash[:error] = @alert
             redirect_to action: :new
        end

    end 

    def show 
        
        @customer = current_user 
        session[:customer_id] = @customer.id 
        session[:page] = 'scheduled'
        @haircut = Haircut.find(params[:id]) 
        @barber = Barber.find(@haircut.barber_id) 
        
    end 


    def destroy 
        @haircut = Haircut.find(params[:id]) 
        @haircut.destroy
        redirect_to customer_path(current_user)
    end
    private 
  

    def safe_params
        params.require('generic').permit!
    end
end
