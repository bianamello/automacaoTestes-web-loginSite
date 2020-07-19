class HeaderPage < SitePrism::Page


    element :signin_button, 'a[class=login]'
    element :user_name, 'a[class=account] > span'
    element :signout_button, 'a[class=logout]'


    def go_login_page
        visit CONFIG['base_url']
		signin_button.click
    end
    
    
    def logout
		signout_button.click
	end

end