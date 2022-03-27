*Settings
Documentation                   Users route test suite

Resource                        ${EXECDIR}/resources/Base.robot

*Test Cases
Add New User
    ${user}                     Factory New User

    Remove User                 ${user}

    #Validação
    ${response}                 POST User  ${user}
    Status Should Be            201  ${response}

    ${user_id}                  Set Variable  ${response.json()}[id]
    Should Be True              ${user_id} > 0

Get User Data
    ${user}                     Factory Get User
    POST User                   ${user}
    ${token}                    Get Token  ${user}
    ${response}                 GET User  ${token}

    Status Should Be            200  ${response}
    Should Be Equal as Strings  ${user}[name]  ${response.json()}[name]
    Should Be Equal as Strings  ${user}[email]  ${response.json()}[email]
    Should Be Equal as Strings  None  ${response.json()}[whatsapp]
    Should Be Equal as Strings  None  ${response.json()}[avatar]
    Should Be Equal as Strings  False  ${response.json()}[is_geek]

Delete User
    #Dado que existe um usuário no sistema
    ${user}                     Factory Delete User
    POST User                   ${user}
    #E tenho um token desse usuário
    ${token}                    Get Token  ${user}
    #Quando faço uma solitação de exclusão na rota /users
    ${response}                 DELETE User  ${token}
    #Então deve retornar o status code 204
    Status Should Be            204  ${response}
    #E ao fazer uma requisição Get, deve retornar o status code 404
    ${response}                 GET User  ${token}
    Status Should Be            404  ${response}

Update User

    ${user}                     Factory Update User
    POST User                   ${user}[before]

    ${token}                    Get Token  ${user}[before]

    ${response}                 PUT User  ${token}  ${user}[after]
    
    Status Should Be            200  ${response}
    
    ${response}                 GET User  ${token}

    Status Should Be            200  ${response}
    Should Be Equal as Strings  ${user}[after][name]  ${response.json()}[name]
    Should Be Equal as Strings  ${user}[after][email]  ${response.json()}[email]
    Should Be Equal as Strings  ${user}[after][whatsapp]  ${response.json()}[whatsapp]
    Should Be Equal as Strings  ${user}[after][avatar]  ${response.json()}[avatar]
    Should Be Equal as Strings  False  ${response.json()}[is_geek]