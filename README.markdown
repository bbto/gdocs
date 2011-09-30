Gdocs gem [This gem is UNDER development]
===

gdocs gem, is a wrapper for Google Doc's service. 

    | gdocs
    |   base.rb
    |   sheets.rb - list and consult sheets
    |   |  list()
    |   |  get(id)
    |   sheet.rb
    |   |  actions that modify or add information to a particular sheet.

Example usage
====

Before using the gem, you should create an application in the google console (http://code.google.com/apis/accounts/docs/OAuth2.html). Since you will need a client_id, c
lient_secret and an api_key. 

    attributes = {
      :client_id => "your client id",
      :client_secret => "client secret",
      :api_key => "api key",
      :redirect_uri => "http://your.application/callback/url"
    }
    @gd = Gdocs::Sheets.new(attributes)

At this point we are able of calling the authorize_url method
    
    @gd.authorize_url #=> Google's authorization url.

Once the user authorized the application, on the redirect\_uri we will receive the user's authorization code. Which we will use
for getting an access\_token.

    @gd.get_access_token(auth_code)
    
This will return an OAuth2::AccessToken. Store access\_token[:token] and access\_token[:refresh\_token] to get persistent access to the user's data until access\_token[:expires\_at].

At this moment, we are able of fetching a list of the sheets of the user just by calling:
    
    @gd.list

Creating
====