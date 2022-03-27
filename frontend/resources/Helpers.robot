*Settings
Documentation                           Test helpers

*Keywords
Add User Into Database
    [Arguments]                         ${user}

    Connect To DB
    Insert User                         ${user}
    Disconnect From Database

Do Login
    [Arguments]                         ${user}

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Credentials
    User Should Be Logged In            ${user}