*** Settings ***

Resource    api_testing_usuarios.resource


*** Variables ***



*** Test Cases ***
Cenario 01: Cadastrar um novo usuario na ServerRest
    Criar um novo usuário
    Cadastrar o novo usuário criado na ServeRest
    # Conferir se o usuário foi cadastrado corretamente

