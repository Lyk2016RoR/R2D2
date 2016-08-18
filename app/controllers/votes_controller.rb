class VotesController < ApplicationController
	before_action :set_book
	before_action :set_vote

	def create 
		@vote = @book.votes.new(vote_params)

		if @comment.save
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
			@book = Book.find(params[:books_id])
		end

	end

end
