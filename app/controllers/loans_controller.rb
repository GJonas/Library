class LoansController < ApplicationController
	
	def new
		@loan = Loan.new
	end
	def index
		@loans = current_user.loans_open.paginate(page: params[:page])

	end

	def lend
		if( current_user.loans_loser )	
			flash[:errors] = "Você pussui emprestimo pendente "  
			redirect_to books_path
		else 
			if(current_user.loans_limit)
				flash[:errors] = "Você ja possui 3 emprestimo "
				redirect_to books_path

			else
				if(duplicate_loan)
					flash[:errors] = "Você ja emprestou este livro "
					redirect_to books_path	
				else

					@book = Book.find(params[:id])
					
					Loan.create(data: Time.now, user: current_user, book: @book)
					call_rake :send_loan_confirmation, user: current_user
					flash[:success] = "Livro #{@book.title} emprestado"
					redirect_to books_path

				end
			end
		end

	end


	def show
		@loan = Loan.find(params[:id])

	end

	

	def update
		loan = Loan.find(params[:id])
		loan.update_attribute(:status, 'devolvido')

		loan.destroy
		flash[:success] = "Emprestimo devolvido!."
		redirect_to :back
		#@loan = current_user.loans.where(book_id: params[:id]).first
		#@loan.delivired (update_attribute(:status, 'desenvolvido'))
	end

	private
	def loan_params
		params.require(:loan).permit(:user_id, :book_id)
	end

	def duplicate_loan
		current_user.loans_open.where(book_id: params[:id]).first
		##loans = current_user.loans.find(book_id: params[:id])
		#!loans.empty?
	end
end


