require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Gdocs" do
  before(:each) do
    mock_oauth_client
    

    @gd = Gdocs::Sheets.new(valid_options_without_refresh_token)
  end
  
  it "his site url should not be nil" do
     @gd.send("site_url").should == "https://spreadsheets.google.com/feeds"
  end
  
  

end