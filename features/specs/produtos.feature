#language: pt
@produtos
Funcionalidade: ServeRest - protudo
    Eu como usuário do sistema
    Quero que ao utilizar a API de protudo
    Seja validado o comportamento esperado

    Swagger: https://serverest.dev/
    
    Esquema do Cenário: [CONTRACT] Validar o endpoint produtos.post
        Enviar uma requisição para o endpoint produto.post
        Validar o retorno do produtos realzado
        Validar o tipo de cada campo do response

        Dado que tenho uma massa configurada do endpoint produto.post para o cenário "<tipo>"
        Quando chamar o endpoint produto.post
        Entao validar o retorno do endpoint produto.post para o cenário "<tipo>"

        Exemplos:
            | tipo |
            | naocadastrado |
            | nomerepetido  |
            | tokeninvalido |
            | usuarionaoadm |
    
    Esquema do Cenário: [CONTRACT] Validar o endpoint produtos.get
        Enviar uma requisição para o endpoint produto.get
        Validar o retorno da lista de produtos
        Validar o tipo de cada campo da response

        Dado que tenho uma massa configurada para o endpoint produto.get para o cenário "<tipo>"
        Quando chamar o endpoint produto.get
        Entao validar o retorno do endpoint produto.get para o cenário "<tipo>"

        Exemplos:
            | tipo |
            | todosprodutos |
            | id |
            | nome |
            | preco |
            | descricao |
            | quantidade |
