*Settings
Documentation                       Geek actions

*Keywords
Go To Geek Form
    Click                           css=a[href="/be-geek"] >> text=Seja um Geek
    Wait For Elements State         css=.be-geek-form  visible  5

Fill Geek Form
    [Arguments]                     ${geek}

    Fill Text                       xpath=//label[text()="Whatsapp"]/..//input  ${geek}[whats]
    Fill Text                       xpath=//label[text()="Descrição"]/../textarea  ${geek}[desc]
    Select Options By               xpath=//label[text()="Conserta Impressora?"]/../select  value  ${geek}[printer_repair]
    Select Options By               xpath=//label[text()="Modelo de trabalho"]/../select  text  ${geek}[work]
    Fill Text                       xpath=//label[text()="Valor da sua hora"]/../input  ${geek}[cost]

Submit Geek Form
    Click                           css=button >> text=Quero ser um Geek

Geek Form Should Be Success
    ${expected_message}             Set Variable  Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State         css=p >> text=${expected_message}  visible  5