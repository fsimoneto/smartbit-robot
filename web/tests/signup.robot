*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes
Resource     ../resources/Base.resource

Test Setup        Start session
Test Teardown     Take Screenshot 

*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    smoke

    ${account}     Create Dictionary
    ...    name=Simoneto Felipe   
    ...    email=felipe@msn.com 
    ...    cpf=34196017002 

    Delete Account By Email    ${account}[email]

    Submit signup form     ${account}
    Verify welcome message

Tentativa de pré-cadastro
    [Template]    Attempt signup
    ${EMPTY}           fnsimoneto@gmail.com    37804708025             Por favor informe o seu nome completo      
    Felipe Simoneto    ${EMPTY}                37804708025             Por favor, informe o seu melhor e-mail
    Felipe Simoneto    fnsimoneto@gmail.com    ${EMPTY}                Por favor, informe o seu CPF 
    Felipe Simoneto    fnsimoneto*gmail.com    37804708025             Oops! O email informado é inválido   
    Felipe Simoneto    fnsimoneto@gmail.com    123456                  Oops! O CPF informado é inválido            

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}     ${cpf}     ${output_message}     

    ${account}     Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}

    Submit signup form     ${account}
    Notice should be       ${output_message}  

