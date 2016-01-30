# Onehub API
# Password Grant REPL

#! /usr/bin/env ruby
require 'oauth2'
require 'json'
require 'pry'

# Set environment variables or use values in this program as necessary
# API_HOST should be 'ws-api.onehub.com' for testing
# API_KEY and SECRET_ACCESS_KEY are obtained by looking at the API Settings tab after logging in (or through obtain_credentials script)

class OAuth2::Response
  def inspect
    JSON.pretty_generate(JSON.parse(body))
  end
end

options = {}
ENV['API_HOST'] = 'ws-api.onehubmaster.com'

# these should be changed / omitted from example code
client_app_secret = '[YOUR CLIENT SECRET]'
client_app_id = "[YOUR CLIENT ID]"
username = '[YOUR EMAIL]'
password = '[YOUR PASSWORD]'

API_HOST = ENV['API_HOST'] || 'ws-api.onehub.com'

client = OAuth2::Client.new(client_app_id, client_app_secret, options.merge({site: "https://#{API_HOST}"})) do |builder|
  builder.request :multipart
  builder.request :url_encoded
  builder.adapter :net_http
end

# the :device field is to uniquely identify the device/application being authorized.

token = client.password.get_token(username, password, :device => "[YOUR DEVICE]")
puts token
token.pry
