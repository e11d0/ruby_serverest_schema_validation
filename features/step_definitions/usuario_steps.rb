# frozen_string_literal: true

Dado('que tenho uma massa configurada do endpoint usuario.post para o cenário {string}') do |type|
  @usuario ||= OpenStruct.new
  @usuario.payload =  type.eql?('emailnovo') ? @payloadusuario : @payloadusuarioinvalido
end

Quando('chamar o endpoint usuario.post') do
  @usuario.response = Usuario.new.usuario_post(@usuario.payload)
rescue StandardError => e
  @usuario.error = e
end

Entao('validar o retorno do endpoint usuario.post para o cenário {string}') do |type|
  expect(@usuario.error).to be_nil

  if type.eql?('emailnovo')
    expect(@usuario.response.code).to eql 201
    expect(@usuario.response['message']).to eql('Cadastro realizado com sucesso')
    expect(@usuario.response['_id']).to be_an(String)
  else
    expect(@usuario.response.code).to eql 400
    expect(@usuario.response['message']).to eql('Este email já está sendo usado')
  end
end

Dado('que tenho uma massa configurada do endpoint usuario.get para o cenário {string}') do |type|
  @usuariopost = Usuario.new.usuario_retornarumid(@payloadusuario)
  @usuario ||= OpenStruct.new
  @usuario.payload = case type
                     when 'todosusuarios'
                       ''
                     when 'porid'
                       @usuariopost
                     else
                       'idinvalido'
                     end
end

Quando('chamar o endpoint usuario.get') do
  @usuario.response = Usuario.new.usuario_get(@usuario.payload)
rescue StandardError => e
  @usuario.error = e
end

Entao('validar o retorno do endpoint usuario.get para o cenário {string}') do |type|
  expect(@usuario.error).to be_nil

  case type
  when 'todosusuarios'
    expect(@usuario.response.code).to eql 200
    expect(@usuario.response['quantidade']).to be_an(Integer)
    expect(@usuario.response['usuarios']).to be_an(Array)
  when 'porid'
    expect(@usuario.response.code).to eql 200
    expect(@usuario.response['nome']).to be_an(String)
    expect(@usuario.response['email']).to be_an(String)
    expect(@usuario.response['password']).to be_an(String)
    expect(@usuario.response['administrador']).to be_an(String)
    expect(@usuario.response['_id']).to be_an(String)
  else
    expect(@usuario.response.code).to eql 400
    expect(@usuario.response['message']).to be_an(String)
    expect(@usuario.response['message']).to eql('Usuário não encontrado')
  end
end

Dado('que tenho uma massa configurada do endpoint usuario.put para o cenário {string}') do |type|
  @usuariopost = Usuario.new.usuario_retornarumid(@payloadusuariopost)
  @usuario ||= OpenStruct.new
  @usuario.idPut =  type.eql?('idexistente') ? @usuariopost : "#{@usuariopost}23"
  @usuario.payload = @payloadusuario
end

Quando('chamar o endpoint usuario.put') do
  @usuario.response = Usuario.new.usuario_put(@usuario.idPut, @usuario.payload)
end

Entao('validar o retorno do endpoint usuario.put para o cenário {string}') do |type|
  expect(@usuario.error).to be_nil

  if type.eql?('idexistente')
    expect(@usuario.response.code).to eql 200
    expect(@usuario.response['message']).to eql('Registro alterado com sucesso')
  else
    expect(@usuario.response.code).to eql 201
    expect(@usuario.response['message']).to eql('Cadastro realizado com sucesso')
    expect(@usuario.response['_id']).to be_an(String)
  end
end
Dado('que tenho uma massa configurada do endpoint usuario.put para o cenário') do
  @usuario ||= OpenStruct.new
  @usuario.idPut = Usuario.new.usuario_retornarumid(@payloadusuario)
  @usuario.payload = @payloadusuarioinvalido
end

Quando('chamar o endpoint usuario.put com payload de email em uso') do
  @usuario.response = Usuario.new.usuario_put(@usuario.idPut, @usuario.payload)
end

Entao('validar o retorno do endpoint usuario.put para o cenário') do
  expect(@usuario.error).to be_nil
  expect(@usuario.response.code).to eql 400
  expect(@usuario.response['message']).to eql('Este email já está sendo usado')
end

Dado('que tenho uma massa configurada do endpoint usuario.delete para o cenário {string}') do |type|
  @usuariopost = Usuario.new.usuario_retornarumid(@payloadusuario)
  @usuario ||= OpenStruct.new
  @usuario.idPut =  type.eql?('idexistente') ? @usuariopost : "#{@usuariopost}23"
end

Quando('chamar o endpoint usuario.delete') do
  @usuario.response = Usuario.new.usuario_delete(@usuario.idPut)
end

Entao('validar o retorno do endpoint usuario.delete para o cenário {string}') do |type|
  expect(@usuario.error).to be_nil
  expect(@usuario.response.code).to eql 200
  if type.eql?('idexistente')
    expect(@usuario.response['message']).to eql('Registro excluído com sucesso')
  else
    expect(@usuario.response['message']).to eql('Nenhum registro excluído')
  end
end

Dado('que tenho uma massa configurada do endpoint usuario.delete para o cenário') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('chamar o endpoint usuario.delete de id com carrinho cadastrado') do
  pending # Write code here that turns the phrase above into concrete actions
end

Entao('validar o retorno do endpoint usuario.delete para o cenário') do
  pending # Write code here that turns the phrase above into concrete actions
end
