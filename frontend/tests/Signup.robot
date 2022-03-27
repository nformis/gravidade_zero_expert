*Settings
Documentation                       Suite de testes de cadastro

Resource                            ${EXECDIR}/resources/Base.robot

Test Setup                          Start Session
Test Teardown                       Finish Session

*Test Cases
Register a New User
    [Tags]                          win
    
    ${user}                         Factory User  faker
    Set Suite Variable              ${user}
    
    Go To Signup Form
    Fill Signup Form                ${user}
    Submit Signup Form
    User Should Be Registered

Duplicated User
    [Tags]                          fail  dup_user

    ${user}                         Factory User  faker

    Add User Into Database          ${user}

    Go To Signup Form
    Fill Signup Form                ${user}
    Submit Signup Form
    Modal Content Should Be         Já temos um usuário com o e-mail informado.

Invalid Email
    [Tags]                          fail  inv_email

    ${user}                         Create Dictionary
    ...                             name=João
    ...                             lastname=Lucas
    ...                             email=jlucas%email.com
    ...                             password=qwe123
    
    Go To Signup Form
    Fill Signup Form                ${user}
    Submit Signup Form
    Error Message Should Be         O email está estranho

Required Fields
    [Tags]                          win  req_fields

    @{expected_notices}             Create List  # @ usado quando se cria um array ou se anda em um array
    ...                             Cadê o seu nome?
    ...                             E o sobrenome?
    ...                             O email é importante também!
    ...                             Agora só falta a senha!

    Go To Signup Form
    Submit Signup Form
    Field Notifications Should Be   ${expected_notices}

    # Field Notification Should Be    Cadê o seu nome?
    # Field Notification Should Be    E o sobrenome?
    # Field Notification Should Be    O email é importante também!
    # Field Notification Should Be    Agora só falta a senha!

# Required Fields
#     [Tags]                          win  req_fields
#     [Template]                      Signup Without Filling Form  # template é replicado para cada parâmetro (frase)
#     Cadê o seu nome?
#     E o sobrenome?
#     O email é importante também!
#     Agora só falta a senha!

# *Keywords
# Signup Without Filling Form
#     [Arguments]                     ${expected_alert}

#     Go To Signup Form
#     Submit Signup Form
#     Field Notification Should Be    ${expected_alert}

Short Password
    [Tags]                          fail  short_pass
    [Template]                      Signup With Short Password

    1
    12
    123
    1234
    12345
    a
    a2
    a2c
    a2c4
    a2c4e
    -1
    teste
    !@#$%

*Keywords
Signup With Short Password
    [Arguments]                     ${short_pass}

    ${user}                         Create Dictionary
    ...                             name=Nilton  lastname=Formis
    ...                             email=nformis@email.com  password=${short_pass}

    Go To Signup Form
    Fill Signup Form                ${user}
    Submit Signup Form
    Field Notification Should Be    Informe uma senha com pelo menos 6 caracteres