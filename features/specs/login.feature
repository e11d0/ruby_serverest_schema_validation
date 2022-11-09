#language: pt
@login.user
Funcionalidade: ServeRest - Login
    Eu como usuário do sistema
    Quero que ao utilizar a API de Login
    Seja validado o comportamento esperado

    Swagger: https://serverest.dev/

    Esquema do Cenário: [CONTRACT] Validar o endpoint login.post
        Enviar uma requisição para o endpoint login.post
        Validar o retorno do login realzado
        Validar o tipo de cada campo do response

        Dado que tenho uma massa configurada do endpoint login.post para o cenário "<tipo>"
        Quando chamar o endpoint login.post
        Entao validar o retorno do endpoint login.post para o cenário "<tipo>"

        Exemplos:
            | tipo     |
            | positivo |
            | negativo |