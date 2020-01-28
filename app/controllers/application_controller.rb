class ApplicationController < ActionController::Base 


    def logout 
        session.clear 
        redirect_to root_path
    end 

    def require_login
        return head(:forbidden) unless session.include? :customer_id
    end 
     
    def current_user 
     
        @customer ||= Customer.find_by(id: session[:customer_id])
    end  
  
    def logged_in? 
        
        current_user != nil || current_user.id == params[:customer_id] || current_user.id == params[:id]
    end 

   
end
