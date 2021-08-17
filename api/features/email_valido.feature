# language: pt
# encode: UTF-8
@cadastrar_email
Funcionalidade: Conseguir cadastrar a empresa do usuário no BOT.

@empresa_cadastrada
Cenario: realizar o cadastro da empresa do usuário. 
    Dado que realizei um cadastro de uma empresa
    Entao valido que ela foi cadastrada com sucesso

@empresa_ncadastrada
Cenario: validar a empresa nao cadastrada. 
     Dado que busco a empresa nao cadastrada
     Entao valido que a empresa nao foi cadastrada com sucesso