*Settings
Documentation                   Be a Geek test suite for fail cases

Force Tags                      fail

Resource                        ${EXECDIR}/resources/Base.robot

Suite Setup                     Fail To Be Geek Preparation

Test Template                   Fail To Be Geek

*Variables
${long_description}             Seu computador está lento? Reiniciando do nada? Talvez seja um virus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formatando, reinstalando o SO, trocando algum componente físico, e porque não, remover o Baidu. Entre em contato agora!

*Test Cases
Whatsapp Blank                  whats       ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
Whatsapp DDD                    whats       19                      O Whatsapp deve ter 11 digitos contando com o DDD
Whatsapp 10d                    whats       1234567890              O Whatsapp deve ter 11 digitos contando com o DDD
Description Blank               desc        ${EMPTY}                Informe a descrição do seu trabalho
Description Short               desc        Conserto PC             A descrição deve ter no minimo 80 caracteres
Description Long                desc        ${long_description}     A descrição deve ter no máximo 255 caracteres
Cost Blank                      cost        ${EMPTY}                Valor hora deve ser numérico
Cost Letter                     cost        qwerty                  Valor hora deve ser numérico
Cost Letter And Number          cost        qwe123                  Valor hora deve ser numérico
Cost Symbols                    cost        !@#                     Valor hora deve ser numérico

*Keywords
Fail To Be Geek
    [Arguments]                 ${key}  ${content}  ${error_message}

    ${user}                     Factory User  be_geek_invalid

    Set To Dictionary           ${user}[geek_profile]  ${key}  ${content}

    Fill Geek Form              ${user}[geek_profile]
    Submit Geek Form
    Error Message Should Be     ${error_message}

    Take Screenshot             fullPage=True

Fail To Be Geek Preparation

    ${user}                     Factory User  be_geek_invalid

    Start Session
    Do Login                    ${user}
    Go To Geek Form