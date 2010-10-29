require 'rubygems'
require 'daum_oauth'
Client = DaumOAuth::Client.new({:consumer_key => '90871bef-fefc-4078-ba9d-121a49c7099a', :consumer_secret => '89ct6-p-v-yqMOf7osfL7PQfnweAG68QepXRl4zn9quCIjrVcpZcZA00'})
request_token = Client.request_token(:oauth_callback => 'http://wafflestudio.net/~thefron/callback.html')
puts "authorize url: #{request_token.authorize_url}"
oauth_verifier = gets.strip
access_token = Client.authorize(request_token.token, request_token.secret, :oauth_verifier => oauth_verifier)
