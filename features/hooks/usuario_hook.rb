# frozen_string_literal: true

Before '@usuarios' do
  @payloadusuario = {
    nome: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    administrador: 'true'
  }
  @payloadusuarioinvalido = {
    nome: Faker::FunnyName.name,
    email: 'fulano@qa.com',
    password: Faker::Internet.password,
    administrador: 'true'
  }
  @payloadusuariopost = {
    nome: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    administrador: 'true'
  }
end
