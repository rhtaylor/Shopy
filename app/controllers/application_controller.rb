class ApplicationController < ActionController::Base 


    def logout 
        session.clear 
        redirect_to root_path
    end 

    def require_login 
        
        return head(:forbidden) unless session.include? :customer_slug
    end 
     
    def current_user 
     
        @customer ||= Customer.find_by(slug: session[:customer_slug])
    end  
  
    def logged_in? 
        
        current_user != nil || current_user.slug == session[:customer_slug] || current_user.slug == session[:slug]
    end 

   
end
