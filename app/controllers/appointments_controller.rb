class AppointmentsController < ApplicationController 
    def new
    @appointment = Appointment.new 
    end 

    def create 
        binding.pry
    end 

end
