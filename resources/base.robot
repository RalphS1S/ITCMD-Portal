***Settings***

Library    SeleniumLibrary

Resource    elements.robot

***Variable***
${BASE_URL}        http://webcnp01.homologacao.sefa.parana:8893/portalsgt_SIT/faces/itcmdSobre
${BASE_URL_DEV}    http://webcdev01.desenvolvimento.sefa.parana:7001/portalsgt/faces/itcmdSobre
${BASE_URL_UAT}    http://webcnp01.homologacao.sefa.parana:8895/itcmd_UAT/faces/itcmdSobre


***Keywords*****
Abrir Navegador
    Open Browser               about:blank    Firefox 
    Set Window Size            1920           1024
    Maximize Browser Window

Fechar Navegador
    Close Browser

Estou Logado
    Go To                   ${BASE_URL}            
    Click Element           ${FAZER_DECLARAÇÃO}
    Double Click Element    ${ACESSAR}

    Wait Until Element Is Visible    ${LGN_USUARIO}    timeout=60      error=None     
    Click Element                    ${LGN_USUARIO}
    Input Text                       ${LGN_USUARIO}    ${USR_CPF}
    Wait Until Element Is Visible    ${LGN_SENHA}      timeout=60      error=None 
    Click Element                    ${LGN_SENHA}
    Input Text                       ${LGN_SENHA}      ${USR_SENHA}

    Wait Until Element Is Visible    ${BTN_ACESSAR}    timeout=60    error=None 
    Click Button                     ${BTN_ACESSAR}

Scroll Page To Location
    [Arguments]           ${x_location}                                   ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

Então valido usuário logado

    ${name_login}          Get Text         ${full_name_login}    
    Page Should Contain    ${name_login}    loglevel=TRACE
    Log                    ${name_login}    


End Test
    Capture Page Screenshot    #filename=ITCMD-screenshot-{index.png}