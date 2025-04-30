*** Settings ***
Documentation    Açoes e elementos do componente de caixa de notificacao

Library     Browser

*** Keywords ***
Notice should be
    [Arguments]    ${target}

    ${element}    Set Variable    css=form .notice

    Wait For Elements State
    ...    ${element}
    ...    visible    5   
  
    Get Text    css=form .notice    equal    ${target}