$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'gdocs'
require 'rspec'
require 'fakeweb'

# Mocks the oauth client. We do not want to make request to the google's api when testing.
def mock_oauth_client
  auth_code = mock('Authorization Code')
  auth_code.stub!(:get_token).and_return("Access Token")
  auth_code.stub!(:authorize_url).and_return("http://google_s_url")
  client = mock()
  client.stub!(:auth_code).and_return(auth_code)
  OAuth2::Client.should_receive(:new).and_return(client)
end

def valid_options_without_refresh_token
  options = {
    #:token => "qwert",
    #:refresh_token => "yuiop",
    #:token_expires_at => "12/20/2012",
    :client_id => "id123",
    :client_secret => "secret",
    :api_key => "key",
    :redirect_uri => "http://localhost:3000/callback"
  }
  return options
end

# Load a fixture file from the fixture folder
def fixture_file(filename)
  return "" if filename == ""
  file_path = File.expand_path(File.dirname(__FILE__) + "/fixtures/" + filename)
  File.read(file_path)
end

# Register the url for fakeweb
def stub_get(url, filename, status=nil)
  options = {:body => fixture_file(filename)}
  options.merge!({:status => status}) unless status.nil?
  FakeWeb.register_uri(:get, url, options)
end

