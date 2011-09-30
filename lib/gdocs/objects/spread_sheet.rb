# This Object will hold the spread sheet attributes
# 
# @id
# @updated
# @title
# @content
# @worksheet_feed
# @url
# @author_name
# @email
module Gdocs
  module Objects
    class SpreadSheet < Gdocs::Objects::XmlParser

      def initialize(attributes)
      end

      # This method receives an xml string, and returns an array of spread_sheet objects.
      def self.sheets(xml_string)
        sheets = parse(xml_string)
        sheets.inject([]) do |sheet, acc|
          # We need to know how will be the structure of the sheet object, so we can generate the sheets based on its attributes
          acc << Gdocs::Objects::SpreadSheet.new(sheet)
          acc
        end
      end

      # This Method returns all the worksheets that a given spread sheet has.
      def worksheet
        @work_sheet ||= Gdocs::Sheets::WorkSheet.fetch(@work_sheet_key)
      end
      
      def instance_attributes
        return ["id", "updated", "title","content", "worksheet_feed", "url", "author_name", "email"] 
      end
      
    end
  end
end