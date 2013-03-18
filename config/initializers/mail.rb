ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => Settings.mail.smtp.host,
  :port                 => Settings.mail.smtp.port,
  :domain               => Settings.mail.smtp.domain,
  :user_name            => Settings.mail.smtp.username,
  :password             => Settings.mail.smtp.password,
  :authentication       => Settings.mail.smtp.authentication,
  :enable_starttls_auto => Settings.mail.smtp.enable_starttls_auto  
}
