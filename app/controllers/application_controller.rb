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

    def pull_date  
        date_time = params[:datetime].values 
        dat = date_time[0..2].join("-") 
        date = dat += " "
        time = date_time[3, 4].join(":") 
        date_ready = date += time   
        params["generic"]["date"] = date_ready
        
    end
    def pull_barber_id 
        barber_name = params[:haircut][:barber].split("-").join(" ")
        @barber = Barber.find_by(name: barber_name)  
        params["generic"]["barber"] = params["haircut"]["barber_id"]
        params["generic"]["barber_id"] = @barber.id 
        
    end 
    def pull_customer_id 
        slug = session[:customer_slug]
        @customer = Customer.find_by(slug: slug) 
        customer_id = current_user.id  
        params["generic"]["customer_id"] = customer_id 
        
    end
    def process_data  
        pull_date
        pull_customer_id 
        pull_barber_id 
    end

end
