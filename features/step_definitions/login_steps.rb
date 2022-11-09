# frozen_string_literal: true

Dado('que tenho uma massa configurada do endpoint login.post para o cenário {string}') do |type|
  @login_in ||= OpenStruct.new
  @login_in.payload = type.eql?('positivo') ? @payload : { 'email': 'email@invalido.com', 'password': '123' }
end

Quando('chamar o endpoint login.post') do
  @login_in.response = Login.new.login_post(@login_in.payload)
rescue StandardError => e
  @login_in.error = e
end

Entao('validar o retorno do endpoint login.post para o cenário {string}') do |type|
  expect(@login_in.error).to be_nil

  if type.eql?('positivo')
    expect(@login_in.response.code).to eql 200
    expect(@login_in.response['message']).to eql('Login realizado com sucesso')
    expect(@login_in.response['authorization']).to be_an(String)
  else
    expect(@login_in.response.code).to eql 401
    expect(@login_in.response['message']).to eql('Email e/ou senha inválidos')
  end
end
