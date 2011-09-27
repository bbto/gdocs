require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Gdocs" do
  before(:all) do
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