# language: pt
# encode: UTF-8
@cadastro_usuario
Funcionalidade: Cadastrar o email usuário no BOT.

@usuario_cadastrado
Cenario: realizar o cadastro do usuario 
    Dado que realizo um cadastro do usuario
    Entao valido que o usuario foi cadastrado com sucesso

@usuario_ncadastrado
Cenario: validar o usuario nao cadastrada. 
     Dado que busco o cadastro do usuario nao cadastrado
     Entao valido que este usuario nao foi cadastrado com sucesso