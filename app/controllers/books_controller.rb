class BooksController < ApplicationController
  before_action :correct_book, only: [:edit, :update]

  def show
    @books = Book.all
    @book = Book.new
    @userbook = Book.find(params[:id])
    @user = @userbook.user
  end

  def index
  	@books = Book.all #一覧表示するためにBookモデルの情報を全てくださいのall
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book)
   else
     @books = Book.all
     @users = User.all
     @user = current_user
     flash[:notice] = "error."
     render :index
   end
 end

 def edit
   @book = Book.find(params[:id])
 end



 def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
   flash[:notice] = "Book was successfully created."
   redirect_to book_path
 else
   flash[:notice] = "error."
   @books = Book.all
   @userbook = Book.find(params[:id])
   @user = @userbook.user
   render :edit
 end
end

def destroy
 @book = Book.find(params[:id])
 @book.destroy
 redirect_to books_path, notice: "successfully delete book!"
end

private

def book_params
 params.require(:book).permit(:title, :body)
end

def correct_book
  @book = Book.find(params[:id])
  if @book.user != current_user
   redirect_to books_path
 end
end

end