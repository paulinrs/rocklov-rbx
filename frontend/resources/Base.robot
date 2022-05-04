*Settings*
Documentation    Arquivo principal do projeto de automação

Library    Browser
Library    Collections
Library    OperatingSystem
Library    libs/mongo.py

Resource    Helpers.robot
Resource    Services.robot
Resource    actions/components.robot
Resource    actions/LoginActions.robot
Resource    actions/EquipoActions.robot

*Keywords*
Start Session
    New Browser    webkit     False     slowMo=00:00:01
    New Page       about:blank
    Set Viewport Size   1920      1080

    Go To       https://rocklov-paulo-web.herokuapp.com

Finish Test
    Take Screenshot

Take Screenshot And Logout
    Take Screenshot
    Do Logout     

Take Screenshot And Go Back
    Take Screenshot
    Go Back

Login Session
    [Arguments]     ${email}    ${password}      

    Start Session
    Login With      ${email}    ${password}