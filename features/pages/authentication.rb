class AuthenticationPage < SitePrism::Page

    element :title_Mr, 'div[id="uniform-id_gender1"]'
    element :title_Mrs, 'input[id="id_gender2"]'
    element :input_firstname, '#customer_firstname'
    element :input_lastname, '#customer_lastname'
    element :input_email, '#email'
    element :input_password, '#passwd'
    element :select_dia, '#uniform-days'
    element :option_dia, '#days > option[value="8"]'
    element :select_mes, '#uniform-months'
    element :option_mes, '#months > option[value="1"]'
    element :select_ano, '#uniform-years'
    element :option_ano, '#years > option[value="1987"]'
    element :input_address, '#address1'
    element :input_city, '#city'
    element :select_state, '#uniform-id_state' 
    element :option_state, '#id_state > option[value="5"]'
    element :input_postalCode, '#postcode'
    element :select_country, '#uniform-id_country'
    element :option_country, '#id_country > option[value="21"]'
    element :input_phoneMobile, '#phone_mobile'
    element :button_registrar, 'button[id="submitAccount"]'

    def create_new_account
        firstname = Faker::Name.first_name
        lastname = Faker::Name.last_name
        title_Mr.click
        input_firstname.set firstname
        input_lastname.set lastname
        input_password.set Faker::Internet.password
        select_dia.click
        option_dia.click
        select_mes.click
        option_mes.click
        select_ano.click
        option_ano.click
        input_address.set Faker::Address.street_address
        input_city.set Faker::Address.city
        select_state.click
        option_state.click
        input_postalCode.set Faker::Number.number(digits:5)
        select_country.click
        option_country.click
        input_phoneMobile.set Faker::Number.number(digits:11)
        button_registrar.click
        new_user = "#{firstname} #{lastname}"
    end

end