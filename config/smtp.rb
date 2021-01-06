require_relative './action_mailers/sandbox_email_interceptor.rb'
require_relative './action_mailers/email_delivery_observer.rb'

if ENV['APP_ENV'] == 'production'
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    domain: 'localhost:3000',
    address:        "smtp.sendgrid.net",
    port:            587,
    authentication: :plain,
    user_name:      'apikey',
    password:       ENV['SENDGRID_API_KEY']
  }
else
  require "letter_opener"
  ActionMailer::Base.add_delivery_method :letter_opener,
    LetterOpener::DeliveryMethod,
    location: File.expand_path('../tmp/letter_opener', __dir__)
  ActionMailer::Base.delivery_method = :letter_opener
end

ActionMailer::Base.prepend_view_path(File.expand_path('../app/views/', __dir__))
ActionMailer::Base.layout('mailer')


if ENV['APP_ENV'] == 'development'
  # Config interceptor
  ActionMailer::Base.register_interceptor(SandboxEmailInterceptor)
end

# config observer
ActionMailer::Base.register_observer(EmailDeliveryObserver)
