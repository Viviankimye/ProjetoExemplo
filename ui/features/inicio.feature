# language:pt
# encode: UTF-8

@inicio
Funcionalidade: Realizar os testes de primero contato com do usuario, relacionado a arvore de incio.

@inicio_1
Cenario: validar o cenario de selecionar parceiras, receber o e-mail de contato com sucesso

    Dado que entrei no chatbot
    Quando seleciono a opcao 'Parcerias'
    Entao valido apresentar um e-mail de contato

    @inicio_2
Cenario: validar a transferencia para cadastro de usuario, ao selecionar a opcao sobre o meu negocio
    Dado que entrei no chatbot
    E seleciono a opcao 'Sobre meu negócio'
    Quando selecionoa opcao de 'Cadastrar minha empresa' na pergunta o que deseja fazer
    Entao valido que fui direcionado para o fluxo de cadastro do usuario