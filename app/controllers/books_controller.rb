class BooksController <  ApplicationController
  before_action :authenticate_user!
  before_filter :load_book, except: [:index, :new]

  def index
    @books = current_user.books
  end

  def new
    @book = Book.new(:author=>Author.new)
  end

  def create
    @book = Book.new(book_params.merge({user: current_user}))
    @book.build_author(author_params)
    render :new and return unless @book.save
    redirect_to books_path
  end

  def update
    render :edit and return unless @book.update(book_params.merge({author_attributes: author_params}))
    redirect_to books_path
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def author_params
    params.require(:book).permit(author: [:name])[:author]
  end

  def book_params
    params.require(:book).permit(:name, :year, :isbn)
  end

  def load_book
    @book = current_user.books.find(params[:id])
    @book
  end
end
