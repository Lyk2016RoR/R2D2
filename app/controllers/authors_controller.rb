class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_author, only: [:show, :update, :edit, :destroy]


  def new
    @author = Author.new
  end

  def index
    @author = Author.all
  end

  def show

  end

  def create

    @author = Author.new(author_params)

    if @author.save
      flash[:success] = 'Islem basariyla tamamlandi'
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      load_form_data
      render :edit
    end

  end

  def destroy
    @author.destroy
    redirect_to authors_path, notice: "Author was deleted"
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:firstName, :description, :lastName)
  end


end
