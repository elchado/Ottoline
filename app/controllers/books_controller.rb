class BooksController < ApplicationController
	before_action :find_book, only: [:show, :edit, :update, :destroy, :upvote]
	def index
		@books = Book.all.order("created_at DESC")
	end 

	def show
		
	end

	def new 
		@book = current_user.books.build
	end

	def create
		@book = current_user.books.build(book_params)

		if @book.save 
			redirect_to @book, notice: "Succesfully created new Book"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if  @book.update(book_params)
			redirect_to @book, notice: "Book was succesfully Updated"
		else 
			render 'edit'
		end
	end

	def destroy
		@book.destroy 
		redirect_to root_path
	end

	def upvote
		@book.upvote_by current_user
		redirect_to :back
	end



	private

	def book_params
		params.require(:book).permit(:title, :description, :image)
	end

	def find_book
		@book = Book.find(params[:id])
	end



end
