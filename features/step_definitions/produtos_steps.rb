# frozen_string_literal: true

Dado('que tenho uma massa configurada do endpoint produto.post para o cenário {string}') do |type|
  @produto ||= OpenStruct.new
  @produto.payload = case type
                     when 'naocadastrado'
                       @payloadproduto
                     when 'nomerepetido'

                     when 'tokeninvalido'

                     when 'produtonaoadm'

                     end
  @produto.tokenAuth = Login.new.login_retorna_token(@payload)

end


Quando('chamar o endpoint produto.post') do
  @produto.response = Produto.new.produto_post(@produto.payload, @produto.tokenAuth)
rescue StandardError => e
  @produto.error = e
end

Entao('validar o retorno do endpoint produto.post para o cenário {string}') do |type|
  expect(@produto.error).to be_nil
  puts(@produto.response)
  case type
  when 'naocadastrado'
    expect(@produto.response.code).to eql 201
  when 'nomerepetido'
    expect(@produto.response.code).to eql 400
  when 'tokeninvalido'
    expect(@produto.response.code).to eql 401
  when 'produtonaoadm'
    expect(@produto.response.code).to eql 403
  end
end
