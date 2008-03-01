# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_piccr_session_id'

  # all helpers, all the time
  helper :all
  
  private
  
    def ensure_logged_in
      return if request.format.atom? or request.content_type == 'application/xml'
      
      unless session[:username]
        redirect_to login_path
        return false
      end
    end    
end
