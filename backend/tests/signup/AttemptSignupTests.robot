*Settings*
Documentation    Attempt Signup Tests

Resource         ${EXECDIR}/resources/Base.robot
Test Template    Attempt Signup

*Test Cases*         scenario          message
Empty Name           empty_name        required name
Empty email          empty_email       required email
Empty Password       empty_pass        required password
Whithout Name        whithout_name     required name
Whithout Email       whithout_email    required email
Whithout Password    whithout_pass     required password
Wrong Email          wrong_email       wrong email

*Keywords*
Attempt Signup
    [Arguments]    ${scenario}    ${message}

    ${attempt}    Get Json    signup    attempt.json    

    ${response}         POST User     ${attempt['${scenario}']}
    Status Should Be    412           ${response}
    Should Be Equal     ${message}    ${response.json()}[error]