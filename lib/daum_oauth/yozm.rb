#methods for yozm

module DaumOAuth
	class Client

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
			#post("/yozm/v1_0/message/add.json", options.merge(:message => message))
			post("/yozm/v1_0/message/add.json", {:message => message})
		end
	end
end
