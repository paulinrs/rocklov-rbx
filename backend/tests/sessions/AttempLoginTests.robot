* Settings *
Documentation    Sessions Attemp Login

Resource         ${EXECDIR}/resources/Base.robot
Test Template    Attempt Login

*Test Cases*          json_file              status_code    message
Incorrect password    incorrect_pass.json    401            Unauthorized
User Not Found        user_not_found.json    401            Unauthorized
Wrong Email           wrong_email.json       412            wrong email
Empty Email           empty_email.json       412            required email
Empty Password        empty_pass.json        412            required password
Whithout Email        whithout_email.json    412            required email
Whithout Password     whithout_pass.json     412            required password    

*Keywords*
Attempt Login
    [Arguments]    ${json_file}    ${status-code}    ${message}

    ${payload}          Get Json          sessions       ${json_file}
    ${response}         POST Login        ${payload}
    Status Should Be    ${status-code}    ${response}

    Should Be Equal    ${message}    ${response.json()}[error]