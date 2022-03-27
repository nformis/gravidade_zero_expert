*Settings
Documentation                           Sessions route test suite

Resource                                ${EXECDIR}/resources/Base.robot

*Variables
&{inc_pass}                             email=nformis@email.com     password=senhaincorreta
&{not_found}                            email=usernf@email.com      password=qwe123
&{inv_email}                            email=nformis#email.com     password=qwe123
&{blank_email}                          email=${EMPTY}              password=qwe123
&{no_email}                             password=qwe123
&{blank_pass}                           email=nformis@email.com     password=${EMPTY}
&{no_pass}                              email=nformis@email.com

*Test Cases
Login Session

    # Dado que temos um usuário cadastrado
    ${payload}                          Factory User Session  signup
    POST User                          ${payload}
    ${payload}                          Factory User Session  login
    #Quando faço uma requisição POST na rota /sessions
    ${response}                         POST Sessions  ${payload}
    ${token_size}                       Get Length  ${response.json()}[token]
    ${expected_token_size}              Convert To Integer  140
    
    #Então o status code deve ser 200
    Status Should Be                    200  ${response}
    #E deve gerar um token JWT
    # Should Be Equal                     ${expected_token_size}  ${token_size}
    Should Be True                      ${token_size} > 0
    #E esse token deve expirar em 10 dias
    Should Be Equal                     10d  ${response.json()}[expires_in]
    # Dictionary Should Contain Value  ${response.json()}  10d  # Outra opção

Should Not Get Token
    [Template]                          Attempt POST Sessions

    ${inc_pass}                         401  Unauthorized
    ${not_found}                        401  Unauthorized
    ${inv_email}                        400  Incorrect email
    ${blank_email}                      400  Required email
    ${no_email}                         400  Required email
    ${blank_pass}                       400  Required pass
    ${no_pass}                          400  Required pass

*Keywords
Attempt POST Sessions
    [Arguments]                         ${payload}  ${status_code}  ${error_message}

    ${response}                         POST Sessions  ${payload}

    Status Should Be                    ${status_code}  ${response}
    Should Be Equal                     ${error_message}  ${response.json()}[error]

# Incorrect Password

#     ${payload}                          Create Dictionary  email=nformis@email.com  password=senhaincorreta
#     ${response}                         POST Session  ${payload}
#     Status Should Be                    401  ${response}
#     Should Be Equal                     Unauthorized  ${response.json()}[error]

# User Not Found

#     ${payload}                          Create Dictionary  email=usernf@email.com  password=qwe123
#     ${response}                         POST Session  ${payload}
#     Status Should Be                    401  ${response}
#     Should Be Equal                     Unauthorized  ${response.json()}[error]

# Invalid Email

#     ${payload}                          Create Dictionary  email=nformis#email.com  password=qwe123
#     ${response}                         POST Session  ${payload}
#     Status Should Be                    400  ${response}
#     Should Be Equal                     Invalid email  ${response.json()}[error]

# Blank Email
#     [Tags]                              no_run

#     ${payload}                          Create Dictionary  email=${EMPTY}  password=qwe123
#     ${response}                         POST Session  ${payload}
#     Status Should Be                    400  ${response}
#     Should Be Equal                     Email is required  ${response.json()}[error]

# Without Email
#     [Tags]                              no_run

#     ${payload}                          Create Dictionary  password=qwe123
#     ${response}                         POST Session  ${payload}
#     Status Should Be                    400  ${response}
#     Should Be Equal                     Email is required  ${response.json()}[error]

# Blank Password
#     [Tags]                              no_run

#     ${payload}                          Create Dictionary  email=nformis@email.com  password=${EMPTY}
#     ${response}                         POST Session  ${payload}
#     Status Should Be                    400  ${response}
#     Should Be Equal                     Password is required  ${response.json()}[error]

# Without Password
#     [Tags]                              no_run

#     ${payload}                          Create Dictionary  email=nformis@email.com
#     ${response}                         POST Session  ${payload}
#     Status Should Be                    400  ${response}
#     Should Be Equal                     Password is required  ${response.json()}[error]

### Referência em Python:
# import requests

# url = "https://getgeeks-users-nilton.herokuapp.com/sessions"

# payload = {
#     "email": "nformis@email.com",
#     "password": "qwe123"
# }
# headers = {"Content-Type": "application/json"}

# response = requests.request("POST", url, json=payload, headers=headers)

# print(response.text)