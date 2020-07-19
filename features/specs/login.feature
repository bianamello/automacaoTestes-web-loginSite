#language: pt

Funcionalidade: Login
    Como um usuário previamente cadastrado
    Quero fazer login no site http://automationpractice.com
    Para acessar a minha conta

@smoke @login_valido
Cenário: Login válido
    Dado que eu seja um usuário cadastrado
    Quando eu efetuo login no site
    Então devo ser autenticado com sucesso

@login_invalido
Esquema do Cenário: Login inválido
    Dado que acesse a página de login
    Quando efetuo login com os seguintes dados inválidos:
        | email    | <email>    |
        | password | <password> |
    Então devo ver a mensagem de alerta "<alert_message>"

    Exemplos:
        | email              | password | alert_message              |
        | teste              | 12345678 | Invalid email address.     |
        | testeame@teste.com | 88888888 | Authentication failed.     |
        |                    | 12345678 | An email address required. |
        | testeame@teste.com |          | Password is required.      |
        |                    |          | An email address required. |