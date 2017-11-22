# if Rails.env.development? || Rails.env.production?
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  #   :address              => 'smtp.sendgrid.net',
  #   :port                 => '2525',
  #   :authentication       => :plain,
  #   :user_name            => ENV['SENDGRID_USERNAME'],
  #   :password             => ENV['SENDGRID_PASSWORD'],
  #   :domain               => 'heroku.com',
  #   :enable_starttls_auto  => true
  # }
  
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.mailgun.org',
  :port                 => '2525',
  :authentication       => :plain,
  :user_name            => ENV['MAILGUN_USERNAME'],
  :password             => ENV['MAILGUN_PASSWORD'],
  :domain               => 'heroku.com',
  :content_type         => 'text/html'
}
  
# ActionMailer::Base.raise_delivery_errors = true
  
# class DevelopmentMailInterceptor
#   def self.delivering_email(message)
#     message.to =  'rjp203@hotmail.com'
#     message.cc = nil
#     message.bcc = nil
#   end
# end

# # Locally, outgoing mail will be 'intercepted' by the
# # above DevelopmentMailInterceptor before going out
# if Rails.env.development?
#   ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
# end

# end