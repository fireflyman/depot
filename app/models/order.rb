class Order < ActiveRecord::Base
  has_many :line_items
  PAYMENT_TYPES = [
# Displayed stored in db
     [ "Check" , "check" ],
     [ "Credit card" , "cc" ],
     [ "Purchase order" , "po" ]
]

validates_presence_of :name, :address, :email, :pay_type
validates_inclusion_of :pay_type, :in =>
   PAYMENT_TYPES.map {|disp, value| value}
   
  def add_line_items_from_cart(cart)
     cart.items.each do |item|
     li = LineItem.from_cart_item(item)
     line_items << li
    end
  end
  
 
  def total 
    line_items.inject(0) {|sum, n| n.product.price * n.quantity + sum} 
  end
  
  
  def close 
    self.status = 'closed' 
    save! 
  end
  
  def closed? 
    status == 'closed' 
  end
  
end
