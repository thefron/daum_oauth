require 'daum_oauth/yozm'

module DaumOAuth
	class Client
		def initialize(options = {})
			@consumer_key = options[:consumer_key]
			@consumer_secret = options[:consumer_secret]
			@token = options[:token]
			@secret = options[:secret]
			#@callback_url = options[:callback_url]
		end

		def authorize(token, secret, options = {})
			request_token = OAuth::RequestToken.new(
				consumer, token, secret
			)
			@access_token = request_token.get_access_token(options)
			@token = @access_token.token
			@secret = @access_token.secret
			@access_token
		end

		def request_token(options={})
			consumer.get_request_token(options)
		end

		def authentication_request_token(options = {})
			request_token(options)
		end

		private

		def consumer
			@consumer ||= OAuth::Consumer.new(
				@consumer_key,
				@consumer_secret,
				{
					:site => 'https://apis.daum.net',
					:request_token_path => '/oauth/requestToken',
					:access_token_path => '/oauth/accessToken',
					:authorize_path => '/oauth/authorize'
				}
			)
		end

		def access_token
			@access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
		end

		def get(path, headers={})
			headers.merge!("User-Agent" => "daum_oauth gem v#{DaumOAuth::VERSION}")
			oauth_response = access_token.get(path, headers)
			JSON.parse oauth_response.body
		end

		def post(path, body='', headers={})
			headers.merge!("User-Agent" => "daum_oauth gem v#{DaumOAuth::VERSION}")
			oauth_response = access_token.post(path, body, headers)
			JSON.parse oauth_response.body
		end
	end
end
