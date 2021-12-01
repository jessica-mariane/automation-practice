#language:pt

Funcionalidade: Cadastro de Conta
    Para que eu possa realizar uma compra no site
    Sendo um usuário ainda não cadastrado
    Posso realizar o meu cadastro preenchendo os campos necessários

    Contexto:
        Dado que estou na página inicial de autenticação

    @registrationSucess
    Esquema do Cenário: Cadastro com sucesso

            E submeto o email válido para prosseguir o cadastro
            E completo os dados com:
            | title   | first_name   | last_name   | password   | birth_day   | birth_month   | birth_year   | newsletter_ok   | receive_emails   | first_name_address   | last_name_address   | company   | address1   | address2   | city   | state   | zip_code   | country   | additional_info   | home_phone   | cell_phone   | additional_email   |
            | <title> | <first_name> | <last_name> | <password> | <birth_day> | <birth_month> | <birth_year> | <newsletter_ok> | <receive_emails> | <first_name_address> | <last_name_address> | <company> | <address1> | <address2> | <city> | <state> | <zip_code> | <country> | <additional_info> | <home_phone> | <cell_phone> | <additional_email> |
        Quando submeto o cadastro
        Então devo ser redirecionado para a página da Minha Conta

        Exemplos:
            | title | first_name | last_name | password | birth_day | birth_month | birth_year | newsletter_ok | receive_emails | first_name_address | last_name_address | company | address1 | address2 | city        | state      | zip_code | country       | additional_info      | home_phone     | cell_phone      | additional_email |
            | 2     | Jéssica    | Mary      | 12345    | 8         | 9           | 1995       | 1             | 1              | Jéssica            | Mariane           | abc     | Rua A    | ap 01    | Los Angeles | California | 01153    | United States | Aprendendo Automação | (11) 2222-2222 | (11) 98888-8888 | teste@teste.x    |
            | 1     | Bob        | Mr        | 12345##  |           |             |            | 1             | 1              | Bob                | Mr                |         | Rua B    |          | Los Angeles | California | 01154    | United States |                      |                | (11) 98888-8888 | teste@teste.x    |
            | 2     | Melina     | Silva     | Pass#18  | 9         | 12          | 1992       | 0             | 0              | Melina             | Silva             |         | Rua B    |          | Los Angeles | California | 01154    | United States |                      |                | (11) 98888-8888 | teste@teste.x    |

    @registrationInvalidEmail
    Esquema do Cenário: Tentativa de cadastro com e-mail inválido

            E preencho com um email inválido para prosseguir o cadastro "<email>"
        Quando submeto o email para verificação
        Então devo receber a mensagem de erro "<msg>"

        Exemplos:
            | email              | msg                                                                                                                  |
            | frvrra@lbthomu.com | An account using this email address has already been registered. Please enter a valid password or request a new one. |
            | a                  | Invalid email address.                                                                                               |
            | jessica@a          | Invalid email address.                                                                                               |
            | 123                | Invalid email address.                                                                                               |
            | *@abc              | Invalid email address.                                                                                               |
            |                    | Invalid email address.                                                                                               |

    @registrationInvalidData
    Esquema do Cenário: Cadastro com sucesso

            E submeto o email válido para prosseguir o cadastro
            E completo os dados com:
            | title   | first_name   | last_name   | password   | birth_day   | birth_month   | birth_year   | newsletter_ok   | receive_emails   | first_name_address   | last_name_address   | company   | address1   | address2   | city   | state   | zip_code   | country   | additional_info   | home_phone   | cell_phone   | additional_email   | msg  |
            | <title> | <first_name> | <last_name> | <password> | <birth_day> | <birth_month> | <birth_year> | <newsletter_ok> | <receive_emails> | <first_name_address> | <last_name_address> | <company> | <address1> | <address2> | <city> | <state> | <zip_code> | <country> | <additional_info> | <home_phone> | <cell_phone> | <additional_email> | <msg |
        Quando submeto o cadastro
        Então devo receber a mensagem de erro "<msg>"

        Exemplos:
            | title | first_name | last_name | password | birth_day | birth_month | birth_year | newsletter_ok | receive_emails | first_name_address | last_name_address | company | address1 | address2 | city        | state      | zip_code | country       | additional_info | home_phone     | cell_phone      | additional_email | msg                      |
            |       |            |           |          |           |             |            |               |                |                    |                   |         |          |          |             |            |          |               |                 |                |                 |                  | There are 9 errors       |
            | 2     |            |           |          |           |             |            |               |                |                    |                   |         |          |          |             |            |          |               |                 |                |                 |                  | There are 9 errors       |
            | 2     | Jéssica    |           |          |           |             |            |               |                |                    |                   |         |          |          |             |            |          |               |                 |                |                 |                  | There are 8 errors       |
            | 2     | Jéssica    | Mary      |          |           |             |            |               |                |                    |                   |         |          |          |             |            |          |               |                 |                |                 |                  | There are 7 errors       |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                |                    |                   |         |          |          |             |            |          |               |                 |                |                 |                  | There are 6 errors       |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            |                   |         |          |          |             |            |          |               |                 |                |                 |                  | There are 6 errors       |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         |          |          |             |            |          |               |                 |                |                 |                  | There are 6 errors       |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          |             |            |          |               |                 |                |                 |                  | There are 5 errors       |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles |            |          |               |                 |                |                 |                  | There are 4 errors       |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California |          |               |                 |                |                 |                  | There are 3 errors       |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    |               |                 |                |                 |                  | There are 2 errors       |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States |                 |                |                 |                  | There is 1 error         |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States | obs             |                |                 |                  | There are 2 errors       |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States | obs             | (11) 2222-2222 |                 |                  | There is 1 error         |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States | obs             | (11) 2222-2222 |                 |                  | There is 1 error         |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States | obs             | (11) 2222-2222 | (11) 98888-8888 |                  | There is 1 error         |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States | obs             |                | (11) 98888-8888 |                  | There is 1 error         |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States | obs             |                | (11) 98888-8888 |                  | There is 1 error         |
            | 2     | Jéssica    | Mary      | 12345#   |           |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States | obs             |                | (11) 98888-aaaa | teste@teste.x    | phone_mobile is invalid. |
            | 2     | Jéssica    | Mary      | 12345#   | 9         |             |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States |                 |                | (11) 98888-8888 | teste@teste.x    | Invalid date of birth    |
            | 2     | Jéssica    | Mary      | 12345#   |           | 12          |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States |                 |                | (11) 98888-8888 | teste@teste.x    | Invalid date of birth    |
            | 2     | Jéssica    | Mary      | 12345#   |           |             | 1995       |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States |                 |                | (11) 98888-8888 | teste@teste.x    | Invalid date of birth    |
            | 2     | Jéssica    | Mary      | 12345#   |           | 12          | 1995       |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States |                 |                | (11) 98888-8888 | teste@teste.x    | Invalid date of birth    |
            | 2     | Jéssica    | Mary      | 12345#   | 9         | 12          |            |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States |                 |                | (11) 98888-8888 | teste@teste.x    | Invalid date of birth    |
            | 2     | Jéssica    | Mary      | 12345#   | 9         |             | 1995       |               |                | Jéssica            | Mary              |         | abc      |          | Los Angeles | California | 01154    | United States |                 |                | (11) 98888-8888 | teste@teste.x    | Invalid date of birth    |