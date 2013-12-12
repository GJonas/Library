class UserMailer < ActionMailer::Base
	def send_loan_confirmation(user)

		@user = user
		mail(to: "#{@user.mail}",
			from: "library@library.com",
			subject: "Confirmação de emprestimo de livro")

	end
end
