class LoansController < ApplicationController
	
	def new
		@loan = Loan.new
	end
	def index
		@loans = current_user.loans.paginate(page: params[:page])
	end

	def lend
	   if( duplicate_loan)	
		  flash[:errors] = "Você ja emprestou este livro "
		  redirect_to books_path
	       else 
	   	      if(current_user.loans.count >= 3)
	   	      	flash[:errors] = "Você ja possui 3 emprestimo "
			    redirect_to books_path

		       else
			     if(current_user.loans.count > 0 && current_user.loans.last.data < Time.now - 7.days)
				   flash[:errors] = "Você pussui emprestimo pendente "
				   redirect_to books_path	
			       else

				     @book = Book.find(params[:id])
				      Loan.create(data: Time.now, user: current_user, book: @book)
				      #mail
				      flash[:success] = "Livro #{@book.title} empretado"
				      redirect_to books_path
				
			        end
		        end
	        end
       
	end


	def show
		@loan = Loan.find(params[:id])

	end

	def	mail

		gmail = Gmail.connect("jonas2moreira@gmail.com","")
		gmail.deliver do
			to "jonas2moreira@gmail.com"
			subject "Having fun in Puerto Rico!"
			text_part do
				flash[:errors] = "Email enviado"
				body "Text of plaintext message."
			end
		end
		gmail.logout
	end

	def destroy
		Loan.find(params[:id]).destroy
		flash[:success] = "Loan deleted."
		redirect_to :users
		#@loan = current_user.loans.where(book_id: params[:id]).first
		#@loan.delivired (update_attribute(:status, 'desenvolvido'))
	end

	private
	def loan_params
		params.require(:loan).permit(:user_id, :book_id)
	end

	def duplicate_loan
		current_user.loans.where(book_id: params[:id]).first
		##loans = current_user.loans.find(book_id: params[:id])
		#!loans.empty?
	end
end


