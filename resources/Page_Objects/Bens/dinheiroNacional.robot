*** Settings ***

#Library    keyword.py

***Keywords***

Ativo Dinheiro em Espécie Moeda Nacional

    Wait Until Page Contains         Bens e Direitos    timeout=60        error=None    
    Wait Until Element Is Visible    ${CAD_BENS}        timeout=60        error=None
    Click Element                    ${CAD_BENS}        modifier=False


    Wait Until Element Is Visible    ${TIPO_BEM}    timeout=60        error=None
    Click Element                    ${TIPO_BEM}    modifier=False

    Wait Until Element Is Visible    ${$_MOEDANAC}    timeout=60        error=None
    Click Element                    ${$_MOEDANAC}    modifier=False

    Wait Until Element Is Visible    ${OBS_MOEDA}    timeout=60               error=None
    Input Text                       ${OBS_MOEDA}    observação regressivo
    Input Text                       ${VLR_DECL}     500.000,00

    Wait Until Element Is Visible    ${BTN_SAV_BENS}    timeout=60         error=None
    Click Element                    ${BTN_SAV_BENS}    modifier=False 

    Wait Until Page Contains    Bens e Direitos    timeout=None    error=None

