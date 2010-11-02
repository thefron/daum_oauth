#methods for blog

module DaumOAuth
	class Client
		def blog_post_list(blogName, options={})
			puts "/blog/post/list.do?#{options.merge(:blogName => blogName, :output => 'json').collect{|k, v| "#{k}=#{v}"}.join('&')}"
			get("/blog/post/list.do?#{options.merge(:blogName => blogName, :output => 'json').collect{|k, v| "#{k}=#{v}"}.join('&')}")
		end

		def blog_post_write(blogName, title, content, tag, options={})
			post("/blog/post/write.do", options.merge(:blogName => blogName, :title => title, :content => content, :tag => tag, :output => 'json'))
		end

		def blog_post_modify(blogName, postId, title, content, tag, options={})
			post("/blog/post/modify.do", options.merge(:blogName => blogName, :postId => postId, :title => title, :content => content, :tag => tag, :output => 'json'))
		end

		def blog_post_read(blogName, posdId)
			post("/blog/post/read.do?blogName=#{blogName}&postId=#{postId}&output=json") 
		end

	end
end
