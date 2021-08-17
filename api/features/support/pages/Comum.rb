class Comum
  def valida_status_code(body, response, status, api)
    if  response.code != 200 || response.code == 201
      p "#{body}"
    end
    if response.code == 200
      p "Status #{response.code}"
    elsif response.code == 400
      p "#{api}: #{response.code}, mensagem: #{body}"
    elsif response.code == 401
      p "#{api}: #{response.code}, mensagem: #{body}"
    elsif response.code == 404
      p "#{api}: #{response.code}, mensagem: #{body}"
    elsif response.code >= 500
      p "Erro de servidor na api #{api}: #{response.code}, mensagem: #{body}, ERRO."
    else response.code != status.to_i
      raise "Status code na api #{api}: #{response.code}, mensagem: #{body}, ERRO."
    end
  end
  def test_post(url, payload, endpoint)
    header = Header.new.cria_header
    RestClient::Request.execute(method: :post, url: url, headers: header, payload: payload, timeout: DATA[$ambiente]['tempo']) do |response, request, result|
      @response = response
      @body = JSON.parse(@response)
    end
    status_code = @response.code 
    valida_status_code(@body, @response, status_code, "#{endpoint}")
    @body
  end
  def test_get(url, endpoint)
    header = Header.new.cria_header
    RestClient::Request.execute(method: :get, url: url, headers: header, timeout: DATA[$ambiente]['tempo']) do |response, request, result|
      @response = response
      @body = JSON.parse(@response)
    end
    status_code = @response.code 
    valida_status_code(@body, @response, status_code, "#{endpoint}")
    @body
  end
end