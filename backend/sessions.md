# API Users

Ator: Aplicação Web / Mobile / Front

## Sessions

### Login do usuário

`Dado que o usuário submeteu o formulário de login com dados corretos`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 200`
`E deve retornar um token JWT na resposta`
`E esse token deve expirar em dez dias`

### Senha incorreta

`Dado que o usuário submeteu o formulário de login com senha incorreta`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 401`
`E deve retornar a mensagem "Unauthorized"`

### Usuário não existe

`Dado que o usuário submeteu o formulário de login com um email não cadastrado`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 401`
`E deve retornar a mensagem "Unauthorized"`

### Email no formato inválido

`Dado que o usuário submeteu o formulário de login com um email com formato inválido`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Invalid email"`

### Email em branco

`Dado que o usuário submeteu o formulário de login com um email em branco`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Email is required"`

### Sem o campo email

`Dado que o usuário submeteu o formulário de login sem o email`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Email is required"`

### Senha em branco

`Dado que o usuário submeteu o formulário de login com a senha em branco`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Password is required"`

### Sem o campo senha

`Dado que o usuário submeteu o formulário de login sem a senha`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Password is required"`