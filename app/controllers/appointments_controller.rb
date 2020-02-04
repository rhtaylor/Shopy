class AppointmentsController < ApplicationController 
    def new
        
        @appointment = @customer.appointments.build
     
    end 

    def create 
        binding.pry
    end 

end
