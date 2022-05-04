*Settings*
Documentation    Implementação da Rota / sessions

*Keywords*
POST Login
    [Arguments]    ${payload}

    ${response}    POST
    ...            ${base_url}/sessions
    ...            json=${payload}
    ...            expected_status=any

    [return]        ${response}