class BooksController <  ApplicationController

  before_action :authenticate_user!

  def index
    @books=current_user.books
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
    @book.author.update(author_params)
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
    @book = Book.new(:author=>Author.new)
  end

  def create
    @book = Book.new(book_params.merge({user: current_user}))
    @book.build_author(author_params)
    render :new and return unless @book.save
    redirect_to books_path
  end

  def author_params
    params.require(:book).permit(author: [:name])[:author]
  end

  private

  def book_params
    params.require(:book).permit(:name, :year, :isbn)
  end

end