module Gdocs
  class WorkSheets
    include Gdocs::Base
    
    def list(worksheet_feed, params = {})
      raise "You need to provide the worksheet feed" unless worksheet_feed
      response = get(worksheet_feed, params)
      p response.body
      @work_sheet = Gdocs::Objects::WorkSheet.new(response.body)
    end
    
    protected
    
    # Defining the url of the service we will fetch information from
    def site_url
      "https://spreadsheets.google.com/feeds"
    end
  end
end