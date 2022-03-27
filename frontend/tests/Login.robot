*Settings
Documentation                       Login test suite

Resource                            ${EXECDIR}/resources/Base.robot

Test Setup                          Start Session
Test Teardown                       Finish Session

*Test Cases
User Logins
    [Tags]                          win

    ${user}                         Factory User  login

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    User Should Be Logged In        ${user}

Incorrect Password
    [Tags]                          inc_pass  fail

    ${user}                         Create Dictionary  email=nformis@email.com  password=passworderrado

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Modal Content Should Be         Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]                          inc_email  fail

    ${user}                         Create Dictionary  email=nformis@emailerrado.com  password=qwe123

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Modal Content Should Be         Usuário e/ou senha inválidos.

Invalid Email
    [Tags]                          inv_email  fail

    ${user}                         Create Dictionary  email=nformis#email.com  password=qwe123

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Field Should Be Type Email

Empty Email  #obrigatoriedade do email
    [Tags]                          null_email  fail

    ${user}                         Create Dictionary  email=  password=qwe123
    ${expected_notice}              Set Variable  E-mail obrigatório

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Field Notification Should Be    ${expected_notice}
    
Empty Password  #obrigatoriedade do pw
    [Tags]                          null_password  fail

    ${user}                         Create Dictionary  email=nformis@email.com  password=
    ${expected_notice}              Set Variable  Senha obrigatória

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Field Notification Should Be    ${expected_notice}

Required Fields  #obrigatoriedade de ambos
    [Tags]                          null_email_password  fail

    @{expected_notices}             Create List
    ...                             E-mail obrigatório
    ...                             Senha obrigatória

    Go To Login Page
    Submit Credentials
    Field Notifications Should Be   ${expected_notices}