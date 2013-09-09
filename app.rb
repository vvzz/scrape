require 'sinatra'
require 'coffee-script'
require 'json'
require 'open-uri'
require 'net/http'
require './parser'


class RegexHelper
  def content_matches_regex node_set, regex_string
    ! node_set.select { |node| node.content =~ /#{regex_string}/ }.empty?
  end
end

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
  url = params[:url]
  AwesomeParser.parse(open(url)).to_json
end



