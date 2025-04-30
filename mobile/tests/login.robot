*** Settings ***
Documentation    Suite de testes de login

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve logar com cpf e IP

    ${data}    Get Json fixture    login

    Insert Membership       ${data}

    Signin with document    ${data}[account][cpf]
    User is logged in   

Nao deve logar com cpf nao cadastrado

    Signin with document    29544132040
    Popup have text         Acesso não autorizado! Entre em contato com a central de atendimento

Nao deve logar com cpf com digito invalido
    [Tags]    temp

    Signin with document    00000014144
    Popup have text         CPF inválido, tente novamente