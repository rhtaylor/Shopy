class AppointmentsController < ApplicationController 
    helper_method :current_user, :logged_in?
    
    def new
        
        @appointment = @customer.appointments.build
     
    end 

    def create 
        date_time = params[:datetime].values 
        dat = date_time[0..2].join("-") 
        date = dat += " "
        time = date_time[3, 4].join(":") 
        date_ready = date += time   
        barber_name = params[:appointment][:barber].split("-").join(" ") 
        barber = Barber.find_by(name: barber_name) 
        service = params[:appointment][:service] 
        slug = session[:customer_slug] 
        @customer = Customer.find_by(slug: slug) 
        customer_id = current_user.id
        @appointment = Appointment.create(service: service, date: date_ready , barber_id: barber.id, customer_id: customer_id) 
        if @appointment.valid? 
            session[:slug] = params[:appointment][:customer_slug] 
            redirect_to  customer_appointment_path(@customer, @appointment)
        end   

    
    def show 
        
        @customer = current_user 
        session[:customer_id] = @customer.id 
        session[:page] = 'appointment'
        @appointment = Appointment.find(params[:id]) 
        @barber = Barber.find(@appointment.barber_id) 
        
    end
    end    


end
