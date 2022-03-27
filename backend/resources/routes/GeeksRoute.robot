*Settings
Documentation               Geeks route

*Keywords
POST Geek
    [Arguments]             ${token}  ${payload}

    ${headers}              Create Dictionary  Authorization=${token}

    ${response}             POST
    ...                     ${URL_API_GEEKS}/geeks
    ...                     json=${payload}
    ...                     headers=${headers}
    ...                     expected_status=any

    [return]                ${response}

GET Geeks
    [Arguments]             ${token}
    
    ${headers}              Create Dictionary  Authorization=${token}

    ${response}             GET
    ...                     ${URL_API_GEEKS}/geeks
    ...                     headers=${headers}
    ...                     expected_status=any

    [return]                ${response}