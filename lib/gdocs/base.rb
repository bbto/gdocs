module Gdocs
  module Base
    module ClassMethods
      
    end

    module InstanceMethods
      # Initializes the object setting the common attributes.
      #
      # @param [Hash] options
      # @option options [String] :api_key Your application's API key, used for non-authenticated requests (for public data).
      # @option options [String] :token The OAuth token to authorize the API client for authenticated requests (for non-public data). This can be supplied after initialization by calling {#authorize}.
      # @option options [String] :refresh_token The OAuth refresh_token, to request a new token if the provided token has expired.
      # @option options [Integer] :token_expires_at The time that the OAuth token expires at in seconds since the epoch.
      # @option options [String] :client_id Your application's Client ID. Required to generate an authorization URL with {#authorize_url}.
      # @option options [String] :client_secret Your application's Client Secret. Required to generate an authorization URL with {#authorize_url}.
      # @option options [String] :redirect_uri The default URI to redirect to after authorization. You can override this in many other methods. It must be specified as an authorized URI in your application's console. Required to generate an authorization URL with #authorize_url.
      # @return [Gplus::Client] A Google+ API client.
      def init(options = {})
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
      
      # Returns the google's authorization url, where the user has grant permissions to the application for using the 
      # requested service.
      def authorize_url
        Raise "define method authorize_url"
      end
      
      # Authorize the API client to access the user's private data.
      #
      # @param [String] auth_code The code returned to your redirect_uri after the user authorized your application to access their Google+ data.
      # @return [OAuth2::AccessToken] An OAuth access token. Store access_token[:token] and access_token[:refresh_token] to get persistent access to the user's data until access_token[:expires_at].
      def authorize(auth_code)
        @access_token = @oauth_client.auth_code.get_token(auth_code, :redirect_uri => @redirect_uri)
      end
    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end