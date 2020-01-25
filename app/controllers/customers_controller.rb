class CustomersController < ApplicationController  
    helper_method :current_user, :logged_in? 
    before_action :require_login
    skip_before_action :require_login, only: [:login, :new, :login_user, :create, :fbook]
    
    def require_login
        return head(:forbidden) unless session.include? :customer_id
    end 
    
    def current_user
        @customer ||= Customer.find_by(id: session[:id])
    end
    
    
    def logged_in?
       current_user != nil
    end 
   
    def fbook
        @auth_name = auth['info']['name']
        if @auth_name 
            @flag = true 
                session[:message] = 'Welcome FACEBOOK USER!'
                @customer = Customer.find_by(name: @auth_name) 
                session[:customer_id] = @customer.id  
        else  
            @flag = false
            session[:errors] = "User does not exist on Facebook and or Shopy" 
            session[:message] = "Login a different way!"
        end
        redirect_to @flag ? customer_path(@customer) : login_user_path
    end
    def login 
        
        @customer = Customer.new
    end 
    def new  
        @customer = Customer.new
        
    end 
    def login_user
         
        password = params[:customer][:password]
        name = params[:customer][:name]
        @customer = Customer.find_by(name: name)
        @customer.try(:authenticate, password) 
        
        if  @customer.try(:authenticate, password)  
        
            session[:customer_id] = @customer.id
            @switch = true
        else
            @switch = false 
            session[:errors] = 'Password incorrect.' 
            session[:page] = 'login'
        end  
        
        redirect_to @switch ? customer_path(@customer) : {action: :login}
    end 

    def create  
        
        @customer = Customer.create(customer_params) 
        
        
        session[:customer_id] = @customer.id
        if @customer.valid?
            
            
            redirect_to customer_path(@customer) 
        else 
            

            flash[:error] = 'one or more problmes' 
            flash[:full_errors] = @customer.errors.details 
            redirect_to action: :new
        end

    end  

    def show 
        session[:page] = 'profile' 
        @customer = Customer.find(params[:id])  
        session[:customer_id] = @customer.id 
        @session = session
        
    end 

    def logout 
        session.clear 
        redirect_to root_path 
    end 

    def require_login
        return head(:forbidden) unless session.include? :customer_id
    end 

private 

    def auth
        request.env['omniauth.auth']
    end
    def customer_params 
        params.require('customer').permit('name', 'phone_number', 'email', 'password', 'password_confirmation')
    end
    
end
