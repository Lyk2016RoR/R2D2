class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :destroy]
	before_action :authorize_admin!, only: [:new, :create, :destroy]


    def new
	  @category = Category.new
	  load_categories
    end

    def index
      @categories = Category.all
    end

    def show
    end

	def create 

		@category = Category.new(category_params)
		if @category.save
			flash[:success] = 'İşlem başarıyla tamamlandı'
			redirect_to category_path(@category)
		else
			load_categories
			render :new
		end
	end

    def destroy
    	@category.destroy
    	redirect_to categories_path
    end


  private

	def authenticate_user!
		
  	end

	def load_categories
		@categories = Category.all.collect {|c| [c.name, c.id]}
	end

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name)
	end

end
