module Gdocs
  class Sheets
    include Gdocs::Base
    # Constructor of this object
    # For the options attribute check Gdocs::Base::InstanceMethods.initialize
    def initialize(options = {})
      init(options)
    end
    
    # Returns the google's authorization url, where the user has grant permissions to the application for using the 
    # requested service.
    # @return [STRING] the google's url for granting permissions to the application.
    def authorize_url
       @oauth_client.auth_code.authorize_url(:redirect_uri => @redirect_uri, :scope => "https://spreadsheets.google.com/feeds")
    end
    
    
  end
end