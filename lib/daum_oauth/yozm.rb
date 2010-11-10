#methods for yozm

module DaumOAuth
	class Client

		#check if authorized to yozm
		def yozm_authorized?
			user_info = yozm_show
			!user_info.nil? and user_info['status'] == 200
		end

		#gets user info
		#if authorized with oauth, the authorized user's info will be returned. 
		#Otherwise, you can specify nick_name or url_name.
		def yozm_show(options = nil)
			if options.nil?
				return get("/yozm/v1_0/user/show.json")
			elsif options[:url_name]
				return get("/yozm/v1_0/user/show.json?url_name=#{options[:url_name]}")
			else options[:nick_name]
				return get("/yozm/v1_0/user/show.json?nick_name=#{options[:nick_name]}")
			end
		end

		#send a message to yozm 
		def yozm_add(message, options={})
			#get("/yozm/v1_0/message/add.json?#{options.merge(:message => URI.encode(message)).collect{|k, v| "#{k}=#{v}"}.join('&')}")
			post("/yozm/v1_0/message/add.json", options.merge(:message => message))
		end
	end
end
