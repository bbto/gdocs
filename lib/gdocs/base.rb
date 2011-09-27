
module Gdocs
  class Base
    def initialize(options = {})
      @api_key = options[:api_key]
      @token = options[:token]
      @refresh_token = options[:refresh_token]
      @token_expires_at = options[:token_expires_at]
      @client_id = options[:client_id]
      @client_secret = options[:client_secret]
      @redirect_uri = options[:redirect_uri]

      @oauth_client = OAuth2::Client.new(
      @client_id,
      @client_secret,
      :site => 'https://spreadsheets.google.com/feeds',
      :authorize_url => 'https://accounts.google.com/o/oauth2/auth',
      :token_url => 'https://accounts.google.com/o/oauth2/token'
      )
    end
    def authorize_url
       @oauth_client.auth_code.authorize_url(:redirect_uri => @redirect_uri, :scope => "https://spreadsheets.google.com/feeds")
    end
  end
end