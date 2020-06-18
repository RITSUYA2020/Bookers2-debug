class BookCommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		@book = Book.find(params[:book_id])
		@new_book_comment = BookComment.new(book_comment_params)
		@new_book_comment.user_id = current_user.id
		@new_book_comment.book_id = @book.id
		if @new_book_comment.save
			flash[:success] = "Comment was successfully created."
			redirect_to book_path(@book)
		else
			@book_comments = @book.book_comments
			@user = current_user
			@new_book = Book.new
			render '/books/show'
		end
	end

	def destroy
		comment = BookComment.find(params[:id])
		comment.destroy
		redirect_to book_path(comment.book_id)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
