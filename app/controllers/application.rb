# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'coderay' 
class ApplicationController < ActionController::Base
  layout "store"
  before_filter :authorize, :except => :login
  helper :all # include all helpers, all the time


  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery  :secret => 'c5f99c5a2d413385eae2dcf2f2d8c221'
  
  # See ActionController::Base for details
 # Uncomment this to filter the contents of submitted sensitive data parameters
 # from your application log (in this case, all fields with names like "password").
 # filter_parameter_logging :password
 
  protected
     def authorize
      unless User.find_by_id(session[:user_id])
       session[:original_uri] = request.request_uri
       flash[:notice] = "Please log in"
       redirect_to :controller => 'admin' , :action => 'login'
      end
     end
end
