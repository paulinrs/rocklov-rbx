*Settings*
Documentation    Delete Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
Delete A Equipo

    ${token}     Get token    paulinn.rs@gmail.com    19012009
    ${equipo}    Get Json     equipos                 violino.json

    Remove equipo    ${equipo}[payload][name]
    ${result}        POST equipo                 ${equipo}                ${token}
    ${equipo_id}     Set Variable                ${result.json()}[_id]

    ${response}     DELETE Equipo        ${token}    ${equipo_id}
    ${response2}    Get Unique Equipo    ${token}    ${equipo_id}

    Status Should Be    204    ${response}
    Status Should Be    404    ${response2}

Equipo Not Found

    ${equipo_id}    Get Mongo Id

    ${token}    Get token    paulinn.rs@gmail.com    19012009

    ${response}    DELETE Equipo    ${token}    ${equipo_id}

    Status Should Be    204    ${response}