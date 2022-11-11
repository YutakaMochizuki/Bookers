class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @id = params[:id]
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
     flash[:notice] = "Book was successfully created"
     redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:coment] = "Book was successfully updated."
      render :show
    else
     render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
     flash[:success] = 'Book was successfully destroyed.'
     redirect_to '/books'
    else
      lash[:success] ='Book was not successfully destroyed.'
      redirect_to '/books'
    end
  end

  private
   def book_params
     params.require(:book).permit(:title, :body)
   end
end
