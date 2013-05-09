class UserMailer < ActionMailer::Base
	default :from => "info@mentorhip.com"
  
  def registration_confirmation(user)
  	@user = user
  	mail(:to => user.email, :subject => "Thanks for Registering!")
  end
end
