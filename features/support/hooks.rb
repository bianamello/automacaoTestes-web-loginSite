Before do
	page.current_window.maximize
	@header = HeaderPage.new
	@login = LoginPage.new
	@authentication = AuthenticationPage.new
end