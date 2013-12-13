class UserMailer < ActionMailer::Base
	def send_loan_confirmation(user)

		@user = user
		mail(to: "jonas2moreira@hotmail.com",
			from: "web.gp.utfpr.edu.br",
			subject: "Confirmação de emprestimo de livro")

	end
end
