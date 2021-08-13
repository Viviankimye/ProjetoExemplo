class Comum
  include Capybara::DSL

############# WEB ##################

  def opcao_existe(opcao)
    assert_selector(EL['label_option'], visible: true)
    qnt_opcoes = all(EL['label_option']).length
    cont = 0
    while cont < qnt_opcoes
      text = all(EL['label_option'], visible: true)[cont].text
      if text.include?(opcao)
        contem_texto = true
        break
      else
        cont +=1
      end
    end
    if contem_texto == true
    else
      raise "texto nao esta sendo apresentado"
    end
  end

  def selecionar_opcao(opcao)
    opcao_existe(opcao)
    find(EL['label_option'], text: opcao).click
  end

  def selecionar_opcao_exato(opcao)
    opcao_existe(opcao)
    find(EL['label_option'], text: opcao, exact_text: true).click
  end

  def clicar_pesquisa(opcao)
    assert_selector(EL['btn_pesquisa'], visible: true, text: opcao)
    find(EL['btn_pesquisa'], text: opcao).click
  end

  def clicar_pesquisa_exato(opcao)
    assert_selector(EL['btn_pesquisa'], visible: true, text: opcao)
    find(EL['btn_pesquisa'], text: opcao, exact_text: true).click
  end

  def texto_existe(texto)
    assert_selector(EL['txt_whats'], visible: true, text: texto)
  end

  def titulo_existe(texto)
    assert_selector(EL['title_text'], visible: true, text: texto)
  end

  def preenche_campo(texto)
    assert_selector(EL['box_text'], visible: true)
    all(EL['box_text'])[0].set(texto)
  end

  def clica_enviar
    all(EL['btn_enviar'])[0].click
  end

  def primeira_opcao
    all(EL['label_option'])[0].click
  end

  def contem_texto(texto)
    sleep(10)
    qtd = ((all(EL['txt_whats']).length) -1)
    text = all(EL['txt_whats'])[qtd].text
      if text.include?(texto)
      else
        raise "texto nao esta sendo apresentado"
      end
  end

  def contem_texto_2(texto)
    sleep(10)
    qtd = ((all(EL['txt_whats']).length))[0]
    text = all(EL['txt_whats'])[qtd].text
      if text.include?(texto)
      else
        raise "texto nao esta sendo apresentado"
      end
  end

  def gera_info
    nome =  Faker::Name.name
    nome = nome.tr('ÂÁÉÍÓÚàáäâãèéëẽêìíïîĩòóöôõùúüûũñç', 'AAEIOUaaaaaeeeeeiiiiiooooouuuuunc')
    nome.gsub! 'Dr. ',''
    nome.gsub! 'Ms. ',''
    nome.gsub! 'Mr. ',''
    nome.gsub! 'Dra. ',''
    nome.gsub! 'Mrs ',''
    nome.gsub! 'Mrs. ',''
    nome.gsub! 'Sr. ',''
    nome.gsub! 'Sra. ',''
    nome.gsub! 'Jr.',''
    cpf = Faker::IDNumber.brazilian_citizen_number(formatted: true)
    email = Faker::Internet.email
    Faker::Config.locale = 'pt-BR'
    celular = Faker::PhoneNumber.cell_phone
    # cep = Faker::Address.zip_code(state_abbreviation = 'Br')
    cep = '01301-000'
    return nome, email, cpf, celular, cep
  end

  def foco_browser
    result = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(result)
  end

   def screenshots (nome)
    sleep(1)
    save_screenshot("data/reports/evidencias/#{nome}.png")
  end

################ WHATS ###############

  def preenche_campo_whats(texto)
    assert_selector(EL['txt_whats1'], visible: true)
    all(EL['txt_whats1'])[0].set(texto)
  end

  def texto_existe_whats(texto)
    assert_selector(EL['conversa_whats'], visible: true, text: texto)
  end
   
  def clica_enviar_whats
    all(EL['btn_enviar1'])[0].click
  end

  def limpar_chat
    assert_selector(EL['menu_whats'], visible: true)
    all(EL['menu_whats'])[1].click
    assert_selector(EL['limpar_chat'], visible: true)
    all(EL['limpar_chat'])[0].click
    assert_selector(EL['btn_clear'], visible: true)
    all(EL['btn_clear'])[0].click
    sleep(2)
  end

  def login_whats
    local = JSON.parse(LOCAL['local_storage'])
  end

################# Altu ##################

  def preenche_campo_altu(texto)
    assert_selector(EL['mensagem_usuario'], visible: true)
    all(EL['mensagem_usuario'])[0].set(texto)
  end

  def texto_existe_altu(texto)
    assert_selector(EL['mensagem_bot'], visible: true, text: texto)
  end

  def clica_enviar_altu
    all(EL['botao_enviar_chat'])[0].click
  end

  def segundo_texto_existe(texto)
    all(EL['txt_whats'], visible: true, minimum:2, text: texto)
  end

  def login_altu
    visit('https://portoconsorcio.altu.com.br/assistants/builder/2')
    assert_selector(EL['login_altu'], visible: true)
    all(EL['login_altu'])[0].set(MASSA['login'])
    assert_selector(EL['senha_altu'], visible: true)
    all(EL['senha_altu'])[0].set(MASSA['senha'])
    all(EL['botao_enviar_altu'])[0].click
    page.driver.open_new_window 
    foco_browser
    sleep(3)
    visit('https://portoconsorcio.altu.com.br/assistants/debugger/2?channel=whatsapp')
    sleep(2)
  end

end