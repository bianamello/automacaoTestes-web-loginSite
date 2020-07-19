class LoginPage < SitePrism::Page

	element :input_email, '#email'
	element :input_password, '#passwd'
	element :login_button, '#SubmitLogin'
	element :message_alert, 'div[class*="alert"] > ol > li'
	element :input_email_create, '#email_create'
	element :create_account_button, '#SubmitCreate'

	def login(user, password)
        input_email.set user
        input_password.set password
        login_button.click
	end

end