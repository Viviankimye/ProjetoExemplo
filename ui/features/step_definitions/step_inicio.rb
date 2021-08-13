Dado("que entrei no chatbot") do
  visit(DATA[$ambiente]['site'])
  Comum.new.texto_existe ('Olá! 👋🏻 Sou a a Ana Paula, voluntária virtual do Ajude o Pequeno.')
end
  
Quando("seleciono a opcao {string}") do |opcao|
  Comum.new.titulo_existe('Para poder te ajudar, me diz sobre o que você deseja falar:')
  Comum.new.selecionar_opcao(opcao)
  Comum.new.screenshots("seleciona_opcao_#{opcao}")
end
  
Entao("valido apresentar um e-mail de contato") do
  Comum.new.texto_existe ('Fico feliz que você quer nos ajudar! Você pode entrar em contato conosco pelo e-mail cadastro@ajudeopequeno.com.br')
  Comum.new.screenshots("email de contato")
end

Quando("selecionoa opcao de {string} na pergunta o que deseja fazer") do |opcao|
    Comum.new.titulo_existe('Certo, e o que você quer fazer?')
    Comum.new.selecionar_opcao(opcao)
    Comum.new.screenshots("opcao_#{opcao}_deseja_fazer")
  end
  
  Entao("valido que fui direcionado para o fluxo de cadastro do usuario") do
    Comum.new.titulo_existe('Para iniciar o seu cadastro me diga, qual é o seu nome completo?')
    Comum.new.screenshots("fluxo_cadastro_usuario")
  end