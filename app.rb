require 'sinatra'
require 'coffee-script'
require 'json'
require 'open-uri'
require 'nokogiri'


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
  puts params[:url]
  content_type :json
  page = Nokogiri::HTML(open(params[:url]))
  names = page.xpath(params[:xPath])

  names.map{|e| {:name => e.to_s}}.to_json
end



