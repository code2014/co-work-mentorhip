ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => ENV['MAILER_DOMAIN'],
  :user_name            => ENV['MAILER_USER'],
  :password             => ENV['MAILER_PASS'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "mentorhip.com"
#heroku config:add MAILER_DOMAIN=XXX MAILER_USER=YYY MAILER_PASS=ZZZ
