task send_loan_confirmation: :environment do 
	user = User.find(ENV['USER_ID'])

	UserMailer.send_loan_confirmation(user).deliver
end
