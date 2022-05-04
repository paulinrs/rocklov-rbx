*Settings*
Documentation    Add Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
Add New Equipo

    ${token}      Get token    paulinn.rs@gmail.com    19012009
    ${equipo}    Get Json     equipos                 fender.json

    Remove equipo    ${equipo}[payload][name]

    ${response}    POST equipo    ${equipo}    ${token}

    Status Should Be    200    ${response}