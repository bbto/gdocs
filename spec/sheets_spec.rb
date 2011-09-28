require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Gdocs" do
  before(:each) do
    auth_code = mock('Authorization Code')
    auth_code.stub!(:get_token).and_return("Access Token")
    auth_code.stub!(:authorize_url).and_return("http://google_s_url")
    client = mock()
    client.stub!(:auth_code).and_return(auth_code)
    OAuth2::Client.should_receive(:new).and_return(client)
    
    @options = {
      :client_id => "1086763820816@developer.gserviceaccount.com",
      :client_secret => "X2MN312pliVJeI-TAj-AlNOo",
      :api_key => "AIzaSyD0zkiqbnmUL_FhBII2FZx4xMZc0F7msKE",
      :redirect_uri => "http://localhost:3000/callback"
    }
    @gd = Gdocs::Sheets.new(@options)
  end
  
  it "should get the access token" do
    puts @gd.authorize_url
  end

end