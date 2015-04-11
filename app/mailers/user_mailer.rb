class UserMailer < ApplicationMailer
default from: 'notifications@example.com'

	def welcome_email(client)
    @client = client
    @url  = "http://example.com/login"
    mail(email: @client.email, topic: "Welcome email")
  end
end
