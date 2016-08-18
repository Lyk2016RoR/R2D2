class BooksController < ApplicationController

  before_action :get_authors_and_categories, only: [:new, :create,:destroy]


  def index
   @books= Book.all
  end

  def new
    @book=Book.new

  end

  def show
    @book=Book.find(params[:id])

  end

  def create

    @book=Book.new(book_params)
    if @book.save
      flash[:success] = 'Islem basariyla tamamlandi'
      redirect_to books_path
    else
      render :new
    end

  end

  def destroy
    @book=Book.find(params[:id])
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

end
