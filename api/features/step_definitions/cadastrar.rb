Dado("que realizo um cadastro do usuario") do
    endpoint = DATA['endpoint']['details_users']
    email_cadastrado = MASSA['email_cadastrado']
    url =  "#{DATA[$ambiente]['url_api']}#{endpoint}?email=#{email_cadastrado}"
    @body = Comum.new.test_get(url, endpoint)
  end
    
  Entao("valido que o usuario foi cadastrado com sucesso") do
    if @body['user'].has_key?("name") == true && @body['user']['name'] == "Murillo Teste"
        p "Detalhes do usuarios esta correto com o nome, Nome: #{@body['user']['name']}"
        if @body['user'].has_key?("email") == true && @body['user']['email'] == "email@mail.com"
            p "Detalhes do usuarios esta correto com o email, Email: #{@body['user']['email']}"
        else 
            raise "email nao esta apresentando corretamente"
        end
      else 
        raise "nome nao apresentado corretamente"
      end
    end
  
  
  Dado("que busco o cadastro do usuario nao cadastrado") do
    endpoint = DATA['endpoint']['details_users']
    email_ncadastro = MASSA['email_ncadastrado']
    url =  "#{DATA[$ambiente]['url_api']}#{endpoint}?email=#{email_ncadastro}"
    @body = Comum.new.test_get(url, endpoint) 
  end
  
  Entao("valido que este usuario nao foi cadastrado com sucesso") do
    if @body['message'].has_key?("error") == true && @body['message']['error'] == "Usuário não encontrado"
        p "Não foi possivel encontrar o usuario, erro: #{@body['message']['error']}" 
     else 
        raise "usuario encontrado"
      end
    end

