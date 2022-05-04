*Settings*
Documentation       Sharad Elements

*Keywords*
Alert Text Should Be
    [Arguments]    ${expect_message}

    ${element}                 Set Variable    css=.alert
    Wait For Elements State    ${element}      visible       5
    Get Text                   ${element}      equal         ${expect_message}