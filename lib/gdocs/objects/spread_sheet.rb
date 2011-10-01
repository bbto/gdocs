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
      # @params [OAuth2::AccessToken] access_token that will be used for connecting with the worksheets object.
      def initialize(attributes, access_token)
        @access_token = access_token
      end

      # This method receives an xml string, and returns an array of spread_sheet objects.
      def self.sheets(xml_string, access_token)
        raise "Please provide an OAuth2::AccessToken instance" unless access_token && access_token.is_a?(OAuth2::AccessToken)
        sheets = Gdocs::Objects::XmlParser.parse(xml_string)
        sheets.inject([]) do |acc, sheet|
          # We need to know how will be the structure of the sheet object, so we can generate the sheets based on its attributes
          acc << Gdocs::Objects::SpreadSheet.new(sheet, access_token)
          acc
        end
      end

      # This Method returns all the worksheets that a given spread sheet has.
      # NOTE the temporal parameter is only for testing that we receive the worksheet information. Once it ready, the worksheet feed
      # will be taken from the xml
      def worksheets(temporal)
        @worksheet_feed = temporal
        gdocs = Gdocs::WorkSheets.new({:token => @access_token.token, :refresh_token => @access_token.refresh_token, :token_expires_at => @access_token.expires_at})
        @worksheets ||= gdocs.list(@worksheet_feed)
      end
      
      def instance_attributes
        return ["id", "updated", "title","content", "worksheet_feed", "url", "author_name", "email"] 
      end
      
    end
  end
end