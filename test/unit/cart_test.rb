require File.dirname(__FILE__) + '/../test_helper'
#products(:ruby_book).title
class CartTest < ActiveSupport::TestCase
   fixtures :products
   
   def setup
    @cart = Cart.new
    @rails = products(:rails_book)
    @ruby = products(:ruby_book)
   end
   
    def test_add_unique_products
      cart = Cart.new
      rails_book = products(:rails_book)
      ruby_book = products(:ruby_book)
      cart.add_product rails_book
      cart.add_product ruby_book
      assert_equal 2, cart.items.size
      assert_equal rails_book.price + ruby_book.price, cart.total_price
      
    end
    
    def test_add_duplicate_product
     cart = Cart.new
     rails_book = products(:rails_book)
     cart.add_product rails_book
     cart.add_product rails_book
     assert_equal 2*rails_book.price, cart.total_price
     assert_equal 1, cart.items.size
     assert_equal 2, cart.items[0].quantity
    end
    
    
    
 end
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
=begin
{
:inclusion => "is not included in the list" ,
:exclusion => "is reserved" ,
:invalid => "is invalid" ,
:confirmation => "doesn't match confirmation" ,
:accepted => "must be accepted" ,
:empty => "can't be empty" ,
:blank => "can't be blank" ,
:too_long => "is too long (maximum is %d characters)" ,
:too_short => "is too short (minimum is %d characters)" ,
:wrong_length => "is the wrong length (should be %d characters)" ,
:taken => "has already been taken" ,
:not_a_number => "is not a number" ,
:greater_than => "must be greater than %d" ,
:greater_than_or_equal_to => "must be greater than or equal to %d" ,
:equal_to => "must be equal to %d" ,
:less_than => "must be less than %d" ,
:less_than_or_equal_to => "must be less than or equal to %d" ,
:odd => "must be odd" ,
:even => "must be even"
}
=end