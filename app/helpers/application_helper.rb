module ApplicationHelper
    def full_name(customer)
        customer.last_name + customer.first_name
    end 
    
    def sub_price(sub)
        sub.item.tax_in_price * sub.count
    end 
    
    def total_price(totals)
        price = 0
        totals.each do |total|
            price += sub_price(total)
        end 
        return price
    end 
    
    def billing(order)
        total_price(current_cart) + order.shipping_cost
    end 
        
end
