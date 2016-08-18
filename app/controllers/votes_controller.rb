class VotesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_book
	
	#before_action :authorize_user!, only: [:edit, :update, :destroy]
	#before_action :set_vote , only: [:create]

	def create 
		@vote = @book.votes.new
		@vote.rating = params[:vote][:rating]
		@vote.user = current_user
		if @vote.save
			redirect_to @book, notice: "Vote saved."
		else 
			redirect_to @book, notice: "Problem occured during saving vote."	
		end
	end

	private

		def vote_params
			params.require(:vote).permit(:rating)
		end

		def set_vote
			@vote = Vote.find(params[:id])
		end

		def set_book
			@book = Book.find(params[:book_id])
		end

		def authorize_user!
    		redirect_to @book, notice: "Not authorized" unless @book.user_id == current_user.id
  		end

end


