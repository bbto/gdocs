module Gdocs
  class Sheets
    include Gdocs::Base
    #@site_url = "https://spreadsheets.google.com/feeds"
    
    # Constructor of this object
    # For the options attribute check Gdocs::Base::InstanceMethods.initialize
    def initialize(options = {})
      init(options)
    end
    
    # Returns a list of the users spread sheets
    def list(params = {})
      get("spreadsheets/private/full", params)
    end
    
    protected
    
    # Defining the url of the service we will fetch information from
    def site_url
      "https://spreadsheets.google.com/feeds"
    end

  end
end