class ApplicationController < ActionController::Base 


    def logout 
        session.clear 
        redirect_to root_path
    end 

    def require_login
        return head(:forbidden) unless session.include? :customer_id
    end 

   
end
