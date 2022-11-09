# frozen_string_literal: true

Before '@produtos' do
  @payloadproduto = {
    nome: "Cloth of #{Faker::FunnyName.name}",
    preco: Faker::Bank.account_number(digits: 4),
    descricao: 'miscellaneous',
    quantidade: Faker::Bank.account_number(digits: 5)
  }
end
