#methods for cafe

module DaumOAuth
	class Client
		def cafe_favorites
			get("/cafe/favorite_cafes.json")
		end

		def cafe_alimis
			get("/cafe/alimis.json")
		end

		def cafe_articles(cafeCode, boardId, page=1)
			get("/cafe/articles/#{cafeCode}/#{boardId}.json?page=#{page}")
		end

		def cafe_boards(cafeCode)
			get("/cafe/boards/#{cafeCode}.json")
		end

		def cafe_recent_articles(cafeCode)
			get("/cafe/recent_articles/#{cafeCode}.json")
		end

		#def cafe_write_article

	end
end
