class BooksController < ApplicationController
	def new
		@book = Book.new
	end
	def index
		@books = Book.search(params[:search], params[:page])
	end


	def show
		@book = Book.find(params[:id])
		
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			redirect_to @book
			flash[:success] = "Livro adicionado com sucesso!"
		else
			render 'new'
		end
	end

	def destroy
		Book.find(params[:id]).destroy
		flash[:success] = "Book deleted."
		redirect_to :books
	end

	private
	def book_params
		params.require(:book).permit(:title, :author, :gender,
			:edition, :year , :avatar)
	end

end
