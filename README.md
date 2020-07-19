## Projeto de automação de WEB

Automação de testes WEB para realizar login no site: http://www.automationpractice.com

**O projeto possui as seguintes Gems:**

- Capybara (capybara é uma ferramenta de teste de integração para Web)
- Cucumber (permite a escrita de testes em uma linguagem muito próxima da natural)
- Faker (usado para gerar dados falsos: nomes, endereços, números de telefone, etc)
- Rspec (framework BDD para ruby)
- Selenium-webdriver (objetivo é imitar o comportamento de um usuário real em um site)
- Site_prism (implementa o padrão Page Object)

**O projeto possui as seguintes funcionalidades:**
- [x] Cenários outline:
	- Cenário de testes para login válido;
	- Cenário de testes para login inválido;
	- Cenário de testes para login criando uma nova conta;
- [x] Desenvolvido no padrão page object;
- [x] Possui relatório dos testes em formato html com evidência dos testes (imagens)- Pasta reports;
- [x] Configurado para rodar no Chrome;
- [x] Configurado para rodar no Jenkins;
- [x] Configurado para gerar relatório no Jenkins;
- [x] Cenários de testes descritos em Gherkin.


### Pré requisitos:

- Gerenciador de versões do Ruby;
- Ruby >= 2.6.1;
- Bundler;
- ChromeDriver

**Dicas:**

*Guia de instalação do Gerenciador de versões do Ruby + Ruby + Bundler + ChromeDriver no Linux:*
- [Rbenv] - O Rbenv fornece suporte para trabalhar com versões do Ruby. Comandos linux para instalação:
	- git clone https://github.com/rbenv/rbenv.git ~/.rbenv
	- echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
	- echo 'eval "$(rbenv init -)"' >> ~/.bashrc
	- source ~/.bashrc
	- type rbenv
	- git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
- [Ruby] - Comandos linux para instalação:
	- rbenv install -l
	- rbenv install 2.6.1
	- rbenv global 2.6.1
	Para verificar se deu tudo certo, digite o comando:
	- ruby -v
- [Bundler]
	- gem install bundler
- [Chrome_Driver] - Configurando navegador Chrome para rodar o testes:
	- Baixar no site: http://chromedriver.chromium.org/downloads. Selecione a versão compatível com o seu sistema;
	- Descompactar o arquivo;
	- Mover o arquivo descompactado para a seguinte pasta: 
		- "/usr/bin/" (utlilize o comando: sudo mv chromedriver /usr/bin/)

*Guia de instalação do Ruby + Devkit + Bundler + ChromeDriver no Windows:*
- [Ruby_Devkit_Bundler]
	- https://medium.com/qaninja/instalando-ruby-cucumber-e-capybara-no-windows-10-acb1fe833a95
- [Chrome_Driver] - Configurando navegador Chrome para rodar o testes:
	- Baixar no site: http://chromedriver.chromium.org/downloads. Selecione a versão compatível com o seu sistema;
	- Descompactar o arquivo;
	- Mover o arquivo descompactado para a seguinte pasta:
        - "C:/Windows"


### Executando os testes:

- 1- Na pasta do projeto execute o seguinte comando que irá instalar as Gems:
	- bundle install

- 2- Para rodar todos os testes utilizando o profile de Produção, execute o seguinte comando na pasta do projeto:
	- bundle exec cucumber -p prod

- Para rodar cenários específicos utilize tags:
	- bundle exec cucumber -p prod -t @login_valido
    - bundle exec cucumber -p prod -t @login_invalido


### Para rodar os testes no Jenkins:

**1-Criando JOB no Jenkins:**
- Criar um novo Job no Jenkins do tipo Pipeline;
- Nas configurações de "Pipeline Definition" selecionar "Pipeline script from SCM" e em "SCM" selecionar o "Git";
- Colocar a URL do projeto de testes no "Repository URL": https://github.com/bianamello/automacaoTestes-web-loginSite.git

**2-Inserindo plugin Cucumber reports no Jenkins (O projeto está configurado no Jenkinsfile para gerar o relatório no Jenkins):**
- Clicar em Gerenciar Jenkins/ Gerenciar plugins
- Clicar em Disponíveis e filtrar por "cucumber reports"
- Selecionar e Baixar
- Após baixar, selecionar a opção para reiniciar o Jenkins

**3-Para rodar os testes no pipeline do Jenkins:**
- Clicar no Job criado
- Clicar em "Construir agora"