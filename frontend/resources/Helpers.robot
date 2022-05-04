* Settings *
Documentation    Aqui teremos as KWs de ajuda

* Keywords *
Get Equipos
    [Arguments]    ${equipo}

    ${fixture}    Get File    ${EXECDIR}/resources/fixtures/equipos.json
    ${json}       Evaluate    json.loads($fixture)                          json

    ${select_equipo}    Set Variable    ${json}[${equipo}]

    [return]    ${select_equipo}


Get Token From LS

    ${token}    LocalStorage Get Item    user_token

    [return]    ${token}

Set Token From LS

    ${TOKEN}    LocalStorage Get Item    user_token

    Set Test Variable    ${TOKEN}

Set Token Suite From LS

    ${TOKEN}    LocalStorage Get Item    user_token

    Set Suite Variable    ${TOKEN}