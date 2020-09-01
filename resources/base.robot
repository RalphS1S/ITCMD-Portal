***Settings***

Library            SeleniumLibrary

Resource           elements.robot

***Variable***
${BASE_URL}    http://webcnp01.homologacao.sefa.parana:8893/portalsgt_SIT/faces/itcmdSobre
#${BASE_URL_DEV}    http://webcdev01.desenvolvimento.sefa.parana:7001/portalsgt/faces/itcmdSobre


***Keywords*****
Abrir Navegador
    Open Browser                     about:blank                                     chrome
    Set Selenium Implicit Wait       10
    Set Window Size                  1440                                            900
    Maximize Browser Window

Fechar Navegador
    Close Browser

Estou Logado
    Go To                            ${BASE_URL}

    Click Element                    ${FAZER_DECLARAÇÃO}
    Click Element                    ${ACESSAR}

    Click Element                    ${LGN_USUARIO}
    Input Text                       ${LGN_USUARIO}                                  ${USR_CPF}
    Wait Until Element Is Visible    ${LGN_SENHA}
    Click Element                    ${LGN_SENHA}
    Input Text                       ${LGN_SENHA}                                    ${USR_SENHA}

    Wait Until Element Is Visible    ${BTN_ACESSAR}
    Click Button                     ${BTN_ACESSAR}

Scroll Page To Location
    [Arguments]                      ${x_location}                                   ${y_location}
    Execute JavaScript               window.scrollTo(${x_location},${y_location})

End Test
    Capture Page Screenshot          #filename=ITCMD-screenshot-{index.png}