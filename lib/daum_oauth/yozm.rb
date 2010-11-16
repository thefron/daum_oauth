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
			elsif options[:nick_name]
				return get("/yozm/v1_0/user/show.json?nick_name=#{options[:nick_name]}")
			else
				return get("/yozm/v1_0/user/show.json")
			end
		end

		#send a message to yozm 
		def yozm_add(message, options={}) #available options: url_shorten, img_url, parent_msg_id
			#get("/yozm/v1_0/message/add.json?#{options.merge(:message => URI.encode(message)).collect{|k, v| "#{k}=#{v}"}.join('&')}")
			post("/yozm/v1_0/message/add.json", options.merge(:message => message))
		end

		#check if a user joined yozm
		def yozm_joined?
			get("/yozm/v1_0/user/joined.json")
		end

		#join yozm
		def yozm_join(nickname, options={})	#available options: sex(N/F/M), birthday(1984-11-14), blood_type(N/A/B/AB/O)
			post("/yozm/v1_0/user/join.json", options.merge(:nickname => nickname))
		end

		def yozm_search(q, options={}) #available options: type(message - default, tag), page, count
			get("/yozm/v1_0/timeline/search.json?#{options.merge(:q => q).collect{|k,v| "#{k}=#{v}"}.join('&')}")
		end

		def yozm_home_timeline(options={}) #available options: max_msg_id, since_msg_id, count
			get("/yozm/v1_0/timeline/home.json?#{options.collect{|k,v| "#{k}=#{v}"}.join('&')}")
		end

		def yozm_user_timeline(url_name, options={}) #available options: next(=since_msg_id?, count)
			get("/yozm/v1_0/timeline/user.json?#{options.merge(:url_name => url_name).collect{|k,v| "#{k}=#{v}"}.join('&')}")
		end

	end
end
