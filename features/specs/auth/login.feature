#language:pt

Funcionalidade: Login
    Para que eu possa realizar minhas compras
    Sendo um usuário do sistema
    Posso acessar o sistema com o email e senha

    Contexto:
        Dado que estou na tela de autenticação

    @loginSuccess
    Cenario: Login com sucesso
        Quando eu submeto minhas credenciais "<email>" e "<password>"
        Então devo ser redirecionado para minha conta

        Exemplos:
            | email              | password |
            | frvrra@lbthomu.com | 12345    |


    @invalidLogin
    Esquema do Cenario: Tentativa de login
        Quando eu submeto minhas credenciais "<email>" e "<password>"
        Então devo ver a mesnagem "<error_message>"

        Exemplos:
            | email              | password | error_message              |
            |                    |          | An email address required. |
            |                    | 12345    | An email address required. |
            | frvrra@lbthomu.com |          | Password is required.      |
            | frvrra             |          | Invalid email address.     |
            | frvrra@lbthomu.com | 123456   | Authentication failed      |
