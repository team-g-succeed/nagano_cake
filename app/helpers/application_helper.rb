module ApplicationHelper
    def full_name(customer)
        customer.last_name + customer.first_name
    end

    def sub_price(sub)
        sub.item.add_tax_items_price * sub.amount
    end

    def total_payment(cart_items)
        price = 0
        cart_items.each do |cart_item|
            price += sub_price(cart_item)
        end
        return price
    end

    def billing(order)
        total_payment(current_customer.cart_items) + order.shipping_cost
    end

end
