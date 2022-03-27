*Settings
Documentation                           Shared Actions

*Keywords
Modal Content Should Be
    [Arguments]                 ${expected_text}

    ${title}                    Set Variable  css=.swal2-title
    ${content}                  Set Variable  css=.swal2-html-container

    Wait For Elements State     ${title}  visible  ${TIMEOUT}
    Get Text                    ${title}  equal  Oops...

    Wait For Elements State     ${content}  visible  ${TIMEOUT}
    Get Text                    ${content}  equal  ${expected_text}

Field Notification Should Be
    [Arguments]                 ${expected_notice}

    Wait For Elements State     css=span[class=error] >> text=${expected_notice}  visible  ${TIMEOUT}

Field Notifications Should Be
    [Arguments]                 ${expected_notices}

    @{got_alerts}               Create List

    ${spans}                    Get Elements  css=span[class=error]

    FOR                         ${span}  IN  @{spans}
        ${text}                 Get Text  ${span}
        Append To List          ${got_alerts}  ${text}
    END

    Lists Should Be Equal       ${got_alerts}  ${expected_notices}

Error Message Should Be
    [Arguments]                 ${expected_error}

    Wait For Elements State     css=span[class=error] >> text=${expected_error}  visible  5