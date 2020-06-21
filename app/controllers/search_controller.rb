class SearchController < ApplicationController
	def search
		@target = params[:search_target]
		if @target == "User"
			method = params[:search_method]
			word = params[:search_word]
			@users = User.search(method, word)
		elsif @target == "Book"
			method = params[:search_method]
			word = params[:search_word]
			@books = Book.search(method, word)
		end
	end
end
