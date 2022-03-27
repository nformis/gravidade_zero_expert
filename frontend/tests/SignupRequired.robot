*Settings
Documentation                       Suite de testes de campos obrigatórios

Resource                            ${EXECDIR}/resources/Base.robot

Suite Setup                         Signup Without Filling Form
Test Teardown                       Finish Session

*Test Cases
Name Is Required
    Field Notification Should Be    Cadê o seu nome?
Last Name Is Required
    Field Notification Should Be    E o sobrenome?
Email Is Required
    Field Notification Should Be    O email é importante também!
Password Is Required
    Field Notification Should Be    Agora só falta a senha!

*Keywords
Signup Without Filling Form

    Start Session
    Go To Signup Form
    Submit Signup Form