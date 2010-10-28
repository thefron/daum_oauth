module YozmOAuth
	class Client
		def add(message, options={})
			#post("/yozm/v1_0/message/add.json", options.merge(:message => message))
			post("/yozm/v1_0/message/add.json", {:message => message})
		end
	end
end
