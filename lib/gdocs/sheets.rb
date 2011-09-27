
module Gdocs
  class Sheets
    include Gdocs::Base
    
    def initialize(options = {})
      init(options)
    end
    
    def authorize_url
       @oauth_client.auth_code.authorize_url(:redirect_uri => @redirect_uri, :scope => "https://spreadsheets.google.com/feeds")
    end
  end
end