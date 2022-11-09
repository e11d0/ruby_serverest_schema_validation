#language: pt
@usuarios
Funcionalidade: ServeRest - usuario
    Eu como usuário do sistema
    Quero que ao utilizar a API de usuario
    Seja validado o comportamento esperado

    Swagger: https://serverest.dev/

    Esquema do Cenário: [CONTRACT] Validar o endpoint usuario.post
        Enviar uma requisição para o endpoint usuario.post
        Validar o retorno do usuario realzado
        Validar o tipo de cada campo do response

        Dado que tenho uma massa configurada do endpoint usuario.post para o cenário "<tipo>"
        Quando chamar o endpoint usuario.post
        Entao validar o retorno do endpoint usuario.post para o cenário "<tipo>"

        Exemplos:
            | tipo     |
            | emailnovo |
            | emailusado |
        
    Esquema do Cenário: [CONTRACT] Validar o endpoint usuario.get
        Enviar uma requisição para o endpoint usuario.get
        Validar o retorno do usuario realzado
        Validar o tipo de cada campo do response

        Dado que tenho uma massa configurada do endpoint usuario.get para o cenário "<tipo>"
        Quando chamar o endpoint usuario.get
        Entao validar o retorno do endpoint usuario.get para o cenário "<tipo>"

        Exemplos:
            | tipo     |
            | todosusuarios |
            | porid |
            | poridinexistente |
    
    Esquema do Cenário: [CONTRACT] Validar o endpoint usuario.put
        Enviar uma requisição para o endpoint usuario.put
        Validar o retorno do usuario realzado
        Validar o tipo de cada campo do response

        Dado que tenho uma massa configurada do endpoint usuario.put para o cenário "<tipo>"
        Quando chamar o endpoint usuario.put
        Entao validar o retorno do endpoint usuario.put para o cenário "<tipo>"

        Exemplos:
            | tipo     |
            | idexistente |
            | idinexistente |

    Esquema do Cenário: [CONTRACT] Validar o endpoint usuario.put para email em uso
        Enviar uma requisição com email em uso para o endpoint usuario.put
        Validar o retorno do usuario realzado para email em uso
        Validar o tipo de cada campo do response

        Dado que tenho uma massa configurada do endpoint usuario.put para o cenário
        Quando chamar o endpoint usuario.put com payload de email em uso
        Entao validar o retorno do endpoint usuario.put para o cenário
    
    Esquema do Cenário: [CONTRACT] Validar o endpoint usuario.delete
        Enviar uma requisição para o endpoint usuario.delete
        Validar o retorno do usuario realzado
        Validar o tipo de cada campo do response

        Dado que tenho uma massa configurada do endpoint usuario.delete para o cenário "<tipo>"
        Quando chamar o endpoint usuario.delete
        Entao validar o retorno do endpoint usuario.delete para o cenário "<tipo>"

        Exemplos:
            | tipo     |
            | idexistente |
            | idinexistente |
    
    Esquema do Cenário: [CONTRACT] Validar o endpoint usuario.delete de id com carrinho cadastrado
        Enviar uma requisição para o endpoint usuario.delete
        Validar o retorno do usuario realzado
        Validar o tipo de cada campo do response

        Dado que tenho uma massa configurada do endpoint usuario.delete para o cenário
        Quando chamar o endpoint usuario.delete de id com carrinho cadastrado
        Entao validar o retorno do endpoint usuario.delete para o cenário