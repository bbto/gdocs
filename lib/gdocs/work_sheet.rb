module Gdocs
  class WorkSheet < Gdocs::Sheets
    
    def self.fetch(key, params = {})
      raise "specify" unless key
      response = get("worksheets/#{key}/private/full", params)
      @work_sheet = Gdocs::Objects::WorkSheet.new(response.body)
    end
    
  end
end