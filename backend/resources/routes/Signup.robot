*Settings*
Documentation    Implementação da Rota / signup

*Keywords*
POST User
    [Arguments]    ${payload}

    ${response}    POST
    ...            ${base_url}/signup
    ...            json=${payload}
    ...            expected_status=any

    [return]        ${response}