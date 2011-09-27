require File.join(File.dirname(__FILE__), '..', 'lib', 'gdocs')

options = {
  :client_id => "1086763820816@developer.gserviceaccount.com",
  :client_secret => "X2MN312pliVJeI-TAj-AlNOo",
  :api_key => "AIzaSyD0zkiqbnmUL_FhBII2FZx4xMZc0F7msKE"
}

gd = Gdocs::Base.new(options)

puts gd.inspect