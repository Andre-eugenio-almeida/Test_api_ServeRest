*** Settings ***

Library    RequestsLibrary
Library    String
Library    collections




*** Variables ***
${TRUE}    true
${RESPOSTA}    value



*** Keywords ***
Criar um novo usuário
    ${palavra_aleatoria}=    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}=    Convert To Lower Case    ${palavra_aleatoria}
    ${EMAIL_TESTE}=          Set Variable             ${palavra_aleatoria}@emailTeste.com
    Set Test Variable        ${EMAIL_TESTE}
    Log                      ${EMAIL_TESTE}



Cadastrar o novo usuário criado na ServeRest
    
    ${body}=    Create Dictionary
    ...    nome=Fulano da Silva
    ...    email=tocha03@hotmail.com
    ...    password=1234
    ...    administrador=true
    Log    ${body}

    Criar sessão na ServeRest

    ${resposta}     POST On Session
    ...             alias=ServeRest
    ...             url=/usuarios
    ...             json=${body}   

    Log             message=${resposta.json()}
   Set Test Variable    ${RESPOSTA}    ${resposta.json()}
   



Criar sessão na ServeRest
    ${headers}    Create Dictionary    accept=application/json    content-type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev     headers=${headers} 




Conferir se o usuário foi cadastrado corretamente
    Log    ${RESPOSTA} 

    