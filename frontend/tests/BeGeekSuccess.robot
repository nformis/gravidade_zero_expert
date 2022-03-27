*Settings
Documentation                           Be a Geek test suite for success cases

Resource                                ${EXECDIR}/resources/Base.robot

Test Setup                              Start Session
Test Teardown                           Finish Session

*Test Cases
Be a Geek
    [Tags]                              be_geek  success

    ${user}                             Factory User  be_geek

    Do Login                            ${user}
    Go To Geek Form
    Fill Geek Form                      ${user}[geek_profile]
    Submit Geek Form
    Geek Form Should Be Success