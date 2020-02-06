class AppointmentsController < ApplicationController 
    helper_method :current_user, :logged_in?
    
    def new
        
        @appointment = @customer.appointments.build
     
    end 

    def create 
        
        params["generic"] = {}
        params["appointment"].each_pair{ |x,y| params["generic"][x] = y } 
        process_data
       
        slug = session[:customer_slug]  
        @customer = current_user
        @appointment = Appointment.create(safe_params) 
        if @appointment.valid? 
            session[:slug] = params[:appointment][:customer_slug] 
            redirect_to  customer_appointment_path(@customer, @appointment)
        end   

    
    def show 
        @collection = Appointment.all.map{ |x| x.service }
        @customer = current_user 
        session[:customer_id] = @customer.id 
        session[:page] = 'appointment'
        @appointment = Appointment.find(params[:id]) 
        @barber = Barber.find(@appointment.barber_id) 
        
    end
    end    

    private 

def safe_params 
 params.require('generic').permit!
end


end
