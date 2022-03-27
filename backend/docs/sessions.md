

# Sessions (Autenticação)

## Senha incorreta
Dado que o usuário submeteu o formulário de login com senha incorreta
Quando faço uma requisição POST para a rota /sessions
Então o statuscode deve ser igual a 401
E a mensagem de erro deve ser "Unauthorized"

## Usuário não existe
Dado que um usuário submeteu o formulário de login com um email que não existe
Quando faço uma requisição POST para a rota /sessions
Então o statuscode deve ser igual a 401
E a mensagem de erro deve ser "Unauthorized"

## Email inválido
Dado que um usuário submeteu o formulário de login com um email com formato inválido
Quando faço uma requisição POST para a rota /sessions
Então o statuscode deve ser igual a 400
E a mensagem de erro deve ser "Invalid email"

## Email em branco
Dado que um usuário submeteu o formulário de login com um email em branco
Quando faço uma requisição POST para a rota /sessions
Então o statuscode deve ser igual a 400
E a mensagem de erro deve ser "Email is required"

## Sem campo email
Dado que um usuário submeteu o formulário de login sem o campo email
Quando faço uma requisição POST para a rota /sessions
Então o statuscode deve ser igual a 400
E a mensagem de erro deve ser "Email is required"

## Senha em branco
Dado que um usuário submeteu o formulário de login com a senha em branco
Quando faço uma requisição POST para a rota /sessions
Então o statuscode deve ser igual a 400
E a mensagem de erro deve ser "Password is required"

## Sem campo senha
Dado que um usuário submeteu o formulário de login sem o campo senha
Quando faço uma requisição POST para a rota /sessions
Então o statuscode deve ser igual a 400
E a mensagem de erro deve ser "Password is required"