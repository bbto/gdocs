$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'gdocs'
require 'rspec'

# Mocks the oauth client. We do not want to make request to the google's api when testing.
def mock_oauth_client
  auth_code = mock('Authorization Code')
  auth_code.stub!(:get_token).and_return("Access Token")
  auth_code.stub!(:authorize_url).and_return("http://google_s_url")
  client = mock()
  client.stub!(:auth_code).and_return(auth_code)
  OAuth2::Client.should_receive(:new).and_return(client)
end