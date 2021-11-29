class BooksController < ApplicationController

 def create
  @newbook = Book.new(book_params)
  @newbook.user_id = current_user.id
  if @newbook.save
     flash[:notice]="You have creatad book successfully."
     redirect_to book_path(@newbook.id)
  else
   @user = current_user
   @books =Book.all
   render :index
  end
 end

 def index
  @books = Book.all
  @user = current_user
  @newbook = Book.new
 end

 def edit
  @book = Book.find(params[:id])
  if @book.user == current_user
   render "edit"
  else
   redirect_to books_path
  end
 end

 def update
  @book = Book.find(params[:id])
  @book.user_id = current_user.id
  if @book.update(book_params)
     flash[:notice]="You have updated book successfully."
     redirect_to book_path(@book.id)
  else
      render :edit
  end
 end

 def show
  @book = Book.find(params[:id])
  @user = @book.user
  @newbook = Book.new
 end

 def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
 end

 def newbook
  @newbook = Book.new(book_params)
 end

 private

 def book_params
  params.require(:book).permit(:title, :body, :user)
 end

end
