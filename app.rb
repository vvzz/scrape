require 'sinatra'
require 'coffee-script'
require 'json'

set :public_folder, 'public'

class CoffeeEngine < Sinatra::Base

  set :views, File.dirname(__FILE__) + '/assets/coffee'

  get "/js/*.js" do
    filename = params[:splat].first
    coffee filename.to_sym
  end

end

use CoffeeEngine

get '/' do
  redirect 'index.html'
end

get '/scrape' do
  content_type :json
  [{id: 5, name: "test"}].to_json
end



