module Gdocs
  class Sheets
    include Gdocs::Base
    
    # Returns a list of the users spread sheets
    def list(params = {})
      response = get("spreadsheets/private/full", params)
      p response.body
      @sheets ||= Gdocs::Objects::SpreadSheet.sheets(response.body, @access_token)
    end
    
    protected
    
    # Defining the url of the service we will fetch information from
    def site_url
      "https://spreadsheets.google.com/feeds"
    end
  end
  
end