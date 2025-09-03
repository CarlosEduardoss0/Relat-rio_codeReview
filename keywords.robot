*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Criar Sessao Booker
    Create Session    booker    ${BASE_URL}

Gerar Token
    [Documentation]    Gera token de autenticação e salva na variável global
    Criar Sessao Booker
    ${body}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${response}=    POST On Session    booker    /auth    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    ${token}=    Get From Dictionary    ${response.json()}    token
    Set Suite Variable    ${TOKEN}    ${token}
