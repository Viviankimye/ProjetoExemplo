Definimos como padrões para esse projeto:

Linguagem de programação: Ruby

Linguagem de escrita dos cenários de teste: Cucumber/Gherkin-pt

Pattern: PageObject - https://martinfowler.com/bliki/PageObject.html

Configuração Windows:

Baixar a versão 2.7.1 do ruby, com DevKit.

https://rubyinstaller.org/downloads/

Passos:

1 - Ao executar o download, você irá ver uma tela para escolher o diretório (utilizar diretório default) e 3 checkbox abaixo, 2 check's que configuram as variáveis de ambiente e adicionam arquivos .rb a instalação atual, e o ultimo é necessário dar um check, que está falando para utilizar o padrão UTF-8 (Padrão de caracteres, assim ele conseguira ler/utilizar caracteres especiais).

2 - Após a instalar, aparecerá um box descrito: run 'ridk install', deixe marcado e clique em "Finish", nesse passo, você já instalou o ruby, mas ainda é necessário instalar o DevKit (Kit de ferramentas para desenvolvimento).

    Abrirá um terminal então instale as 3 opções na ordem 1,2,3 que irá ser instalados pacotes e será realizado configurações, é possível fazer as mesmas configurações manuais ou por linha de comando, mas nas últimas versões do ruby, eles criaram essa interface para facilitar.

Configuração linux:

Passos:

1 - update the package index 
  - sudo apt update

2 - instalação do ruby
  - sudo apt install ruby-full


3 - habilitar comando para desenvolvedor:

  - sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev

4 - habilitar permissao:

  - sudo gem update --system --no-user-install

Instalando o Bundler:
O bundler é nossa gema que gerencia as dependências do projeto, ele utiliza como referência para o seu trabalho o arquivo Gemfile, que é onde você adiciona todas as dependências do seu projeto.

Executar o comando abaixo:

Pra você utiliza-lo é necessário instalar, executando o comando abaixo no terminal:

  - gem install bundler

atualizar e baixar as gems para o projeto:
  
  - bundle update --bundler

Realizar o download do chromedriver e geckodriver nos respectivos sites, e colocar os arquivos dentro da pasta Ruby27-x64/bin.... Obs: o chrome headless (chrome sem interface, mas tira print screen do mesmo jeito, é muito utilizado para CI, que o servidor não tem uma interface) já vem baixado automaticamente junto com o chromedriver.

  - http://chromedriver.chromium.org/downloads
  - https://github.com/mozilla/geckodriver/releases

Executando testes
Para realizar execução dos testes é necessário realizar os comandos abaixo no terminal dentro da pasta do projeto.

Parametros:

cucumber: comando que inicia execução dos casos de teste.

Possibilidades de browser configurados, chrome, chrome_headless, firefox, ie.
- chrome=true: sinaliza que desejo executar os testes somente no navegador Chrome.(É possível configurar os outros navegadores no arquivo: ..\features\support\env.rb)

Rodar por feature, passar o caminho, Ex:

features/exemplo.feature

Rodar utilizando as tags:

-t @exemplo

Rodar por ambiente, ambientes são configurados dentro do arquivo support/env.rb e data/data.yml:
  ti=true
  qa=true
  prod=true

######### Exemplos de comando completo #########
## Rodar apenas a feature específica.
  cucumber features/exemplo.feature chrome=true
## Rodar todos os cenarios com a tags.
  cucumber prod=true chrome=true -t @exemplo

Gem que serve de auxilio na criação do projeto e Configuração:(Pretest)

- gem install pretest
- pretest environment