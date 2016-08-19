class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_book, only: [:show, :destroy]


  def index
   @books= Book.all
  end

  def new
    @book=Book.new
    get_authors_and_categories

  end

  def show
    @vote = @book.votes.build
  end

  def create

    @book=Book.new(book_params)
    if @book.save
      flash[:success] = 'Islem basariyla tamamlandi'
      redirect_to books_path
    else
      get_authors_and_categories
      render :new
    end

  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Idea was deleted"

  end

  private

  def book_params
    params.require(:book).permit(:name,:author_id,:category_id)
  end

  def get_authors_and_categories
    @authors = Author.all.collect {|c| [c.firstName, c.id ] }
    @categories = Category.all.collect {|c| [c.name, c.id ] }
  end

  def set_book
    @book = Book.find(params[:id])
  end

end
