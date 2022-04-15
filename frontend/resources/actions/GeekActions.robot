*Settings
Documentation                       Geek actions

*Keywords
Go To Geek Form
    Click                           css=a[href="/be-geek"] >> text=Seja um Geek
    Wait For Elements State         css=.be-geek-form  visible  5

Go To Geeks
    Click                           css=a[href="/geeks"] >> text=Geeks

    Wait For Elements State         css=.title strong >> text=Estes são os Geeks disponíveis.
    ...                             visible  5

Fill Geek Form
    [Arguments]                     ${geek}

    Fill Text                       xpath=//label[text()="Whatsapp"]/..//input  ${geek}[whats]
    Fill Text                       xpath=//label[text()="Descrição"]/../textarea  ${geek}[desc]
    Select Options By               xpath=//label[text()="Conserta Impressora?"]/../select  value  ${geek}[printer_repair]
    Select Options By               xpath=//label[text()="Modelo de trabalho"]/../select  text  ${geek}[work]
    Fill Text                       xpath=//label[text()="Valor da sua hora"]/../input  ${geek}[cost]

Fill Search Form
    [Arguments]                     ${target_option}  ${target_text}

    IF                              '${target_option}'
                                    Select Options By  id=printer_repair  value  ${target_option}
    END

    Fill Text                       id=desc  ${target_text}

Submit Geek Form
    Click                           css=button >> text=Quero ser um Geek

Submit Search Form
    Sleep                           1
    Click                           css=button[type="submit"] >> text=Buscar

Geek Form Should Be Success
    ${expected_message}             Set Variable  Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State         css=p >> text=${expected_message}  visible  5

Geek Should Be Found
    [Arguments]                     ${geek}

    ${full_name}                    Set Variable  ${geek}[name] ${geek}[lastname]

    ${target_geek}                  Get Element  xpath=//strong[contains(text(), "${full_name}")]/../../..

    ${work}                         Convert To Lower Case  ${geek}[geek_profile][work]

    Get Text                        ${target_geek}  contains  Atendimento ${work}
    Get Text                        ${target_geek}  contains  ${geek}[geek_profile][desc]
    Get Text                        ${target_geek}  contains  ${geek}[geek_profile][cost]

    Set Suite Variable              ${target_geek}

Alien Icon Should Be Visible
    Get Text                        ${target_geek}  contains  👽

Geek Not Found
    Wait For Elements State         css=.search-not-found p >> text=Não encontramos Geeks com o(s) termo(s) informado na busca!
    ...                             visible  5