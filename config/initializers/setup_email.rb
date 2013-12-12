ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "127.0.0.1",
  :port                 => 25,
  :domain               => 'web.gp.utfpr.edu.br',
  :user_name            => 'library@library.com',
  :password             => '123456',
  :authentication       => 'plain',
  :enable_starttls_auto => true 
}