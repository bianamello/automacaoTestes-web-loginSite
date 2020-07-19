# -----------------------------login válido-----------------------------
Dado("que eu seja um usuário cadastrado") do
    @users = {"email"=>"novaconta@email.com", "password"=>"12345678", "name"=>"Fabiana Mello"}
end
  
Quando("eu efetuo login no site") do
    @header.go_login_page
    @login.login(@users['email'], @users['password'])
end
  
Então("devo ser autenticado com sucesso") do
    expect(@header.user_name.text).to eql @users['name']
    screenshot(nome_cenario = 'Login_efetuado')
    @header.logout
end

# -----------------------------login com nova conta-----------------------------
Dado("que eu seja um usuário sem cadastro") do
    @header.go_login_page
end

Quando("que eu crio uma nova conta no site") do
    @login.open_new_account
    screenshot(nome_cenario = 'Nova_conta')
    @new_user = @authentication.create_new_account
end

Então("devo ser autenticado com meu novo usuário") do
    expect(@header.user_name.text).to eql @new_user
    @header.logout
end

# -----------------------------login inválido-----------------------------
Dado("que acesse a página de login") do
    @header.go_login_page
end

Quando("efetuo login com os seguintes dados inválidos:") do |table|
    @users = table.rows_hash
    @login.login(@users['email'], @users['password'])
end

Então("devo ver a mensagem de alerta {string}") do |alert_message|
    expect(@login.message_alert.text).to eql alert_message
    screenshot(nome_cenario = alert_message)
end