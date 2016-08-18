class BooksController < ApplicationController

  def index
   @books= Book.all
  end

  def new
    @authors = Author.all.collect {|c| [c.name, c.id ] }
    @book=Book.new

  end

  def create
    @book=Book.new(book_params)
    if @book.save
      flash[:success] = 'Islem basariyla tamamlandi'
    else
      render :new
    end

  end

  private

  def book_params
    params.require(:book).permit(:name)
  end

end
