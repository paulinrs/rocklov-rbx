*Settings*
Documentation    Login Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session
Test Teardown    Finish Test

*Test Cases*
User Login

    Login With                  paulinn.rs@gmail.com             19012009
    User Should Be Logget In
    [Teardown]                  Take Screenshot And Logout

Incorrect Password
    [Tags]    attempt_login

    Login With              roberto@jose.com                 1234567
    Alert Text Should Be    Usuário e/ou senha inválidos.

User Not Found
    [Tags]    attempt_login

    Login With              rob@jose.com                     1234567
    Alert Text Should Be    Usuário e/ou senha inválidos.

Empty Email
    [Tags]    attempt_login

    Login With              ${EMPTY}                          1234567
    Alert Text Should Be    Oops. Informe um email válido!

Empty Password
    [Tags]    attempt_login

    Login With              roberto@jose.com                    ${EMPTY}
    Alert Text Should Be    Oops. Informe sua senha secreta!

Incorrect Email
    [Tags]    attempt_login

    Login With              roberto&jose.com                  1234567
    Alert Text Should Be    Oops. Informe um email válido!
