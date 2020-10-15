class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end
  
  def create    
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to controller: :books, action: :show
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_path, success: "Book was successfully destroyed."
    else
      redirect_to books_path, warning: "failed"
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
