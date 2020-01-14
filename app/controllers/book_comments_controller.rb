class BookCommentsController < ApplicationController
	def create
		book = Book.find(post_comment_params[:book_id])
		comment = BookComment.new(post_comment_params)
		comment.user_id = current_user.id
		comment.save
		redirect_to book_path(book)
	end

	def destroy
		book_comment = BookComment.find(params[:id])
		book_comment.destroy
		redirect_to book_path(book_comment.book)
	end

	private
	def post_comment_params
		params.require(:book_comment).permit(:user_id,:book_id,:comment)
	end
end