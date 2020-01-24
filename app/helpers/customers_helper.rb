module CustomersHelper 

    def current_u(x: y)
        Customers.where(x: y)
    end
end
