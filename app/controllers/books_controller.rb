class BooksController <  ApplicationController

  def index
    @books=Book.all
  end

  def show
  @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    success = @book.update(book_params)
    if !success
      render :edit and return
    end
    redirect_to books_path
  end

  def destroy
  @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

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
    params.require(:book).permit(:name, :author, :year, :isbn)
  end

end