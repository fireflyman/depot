require File.dirname(__FILE__) + '/../test_helper'

class AdminControllerTest < ActionController::TestCase
  fixtures :users
  
 def test_index_without_user
  get :index
  assert_redirected_to :action => "login"
  assert_equal "Please log in", flash[:notice]
 end
 
  def test_index_with_user
  get :index, {}, {:user_id => users(:dave).id }
  assert_response :success
  assert_template "index"
end

 def test_login
  dave = users(:dave)
  post :login, :name => dave.name, :password => 'secret'
  assert_redirected_to :action => "index"
  assert_equal dave.id, session[:user_id]
 end

 def test_bad_password
  dave = users(:dave)
  post :login, :name => dave.name, :password => 'wrong'
  assert_template "login"

 end
 

 
end
