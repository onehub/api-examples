# Onehub API
# Password Grant REPL

#! /usr/bin/env ruby
require 'oauth2'
require 'json'
require 'pry'

class OAuth2::Response
  def inspect
    JSON.pretty_generate(JSON.parse(body))
  end
end

# Set required environment variables.
options = {}

# ENV['API_HOST'] = 'ws-api.onehub.com'
API_HOST = ENV['API_HOST'] || 'ws-api.onehub.com'

# [YOUR CLIENT SECRET] and [YOUR CLIENT ID] are obtained from the Onehub Developer tab after creating a new OAuth client.
# http://developer.onehub.com

client_app_secret = '[YOUR CLIENT SECRET]'
client_app_id = "[YOUR CLIENT ID]"

# Email and password for the requesting Onehub Developer account.
username = '[YOUR EMAIL]'
password = '[YOUR PASSWORD]'

# Create a new OAuth 2 client and pass in defined variables.
client = OAuth2::Client.new(client_app_id, client_app_secret, options.merge({site: "https://#{API_HOST}"})) do |builder|
  builder.request :multipart
  builder.request :url_encoded
  builder.adapter :net_http
end

# Get and display the OAuth 2 token. The :device field is to uniquely identify the device/application being authorized.
token = client.password.get_token(username, password, :device => "[YOUR DEVICE]")
puts token

# Create a faux REPL via Pry allowing for subsequent API calls to be made with the token.
token.pry
