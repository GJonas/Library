ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'web.gp.utfpr.edu.br',
  :user_name            => 'progweb4@gmail.com',
  :password             => 'progweb4forte',
  :authentication       => 'plain',
  :enable_starttls_auto => true 
}