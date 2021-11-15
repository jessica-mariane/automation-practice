#language:pt

Funcionalidade: Cadastro de Conta
    Para que eu possa realizar uma compra no site
    Sendo um usuário ainda não cadastrado
    Posso realizar o meu cadastro preenchendo os campos necessários

    Contexto:
        Dado que estou na página inicial de autenticação

    @registrationSucess
    Esquema do Cenário: Cadastro com sucesso

            E submeto o email válido para prosseguir o cadastro "<email>"
            E completo os dados com:
            | title   | first_name   | last_name   | password   | birth_day   | birth_month   | birth_year   | newsletter_ok   | receive_emails   | first_name_address   | last_name_address   | company   | address1   | address2   | city   | state   | zip_code   | country   | additional_info   | home_phone   | cell_phone   | additional_email   |
            | <title> | <first_name> | <last_name> | <password> | <birth_day> | <birth_month> | <birth_year> | <newsletter_ok> | <receive_emails> | <first_name_address> | <last_name_address> | <company> | <address1> | <address2> | <city> | <state> | <zip_code> | <country> | <additional_info> | <home_phone> | <cell_phone> | <additional_email> |
        Quando submeto o cadastro
        Então devo ser redirecionado para a página da Minha Conta

        Exemplos:
            | title | first_name | last_name | password | birth_day | birth_month | birth_year | newsletter_ok | receive_emails | first_name_address | last_name_address | company | address1 | address2 | city      | state      | zip_code | country       | additional_info      | home_phone     | cell_phone      | additional_email | email              |
            | Mrs.  | Jéssica    | Mariane   | 12345    | 8         | 9           | 1995       | 1             | 1              | Jéssica            | Mariane           |         | Rua A    | ap 01    | São Paulo | California | 01153    | United States | Aprendendo Automação | (11) 2222-2222 | (11) 98888-8888 | teste@teste.x    | frvrra@lbthomu.com |