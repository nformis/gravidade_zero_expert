*Settings
Documentation               Sessions route

*Keywords
POST Sessions
    [Arguments]             ${payload}

    ${response}             POST
    ...                     ${URL_API_USERS}/sessions
    ...                     json=${payload}
    ...                     expected_status=any

    [return]                ${response}