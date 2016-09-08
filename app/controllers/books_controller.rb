class BooksController <  ApplicationController

  def index
    @books=Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    success = @book.save
    if !success
      render :new and return
    end
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :age)
  end

end