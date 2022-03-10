*** Settings ***

#Library    keyword.py

***Keywords***

Ativo Precatório

    Wait Until Page Contains         Bens e Direitos    timeout=60        error=None    
    Wait Until Element Is Visible    ${CAD_BENS}        timeout=60        error=None
    Click Element                    ${CAD_BENS}        modifier=False

    Wait Until Element Is Visible    ${TIPO_BEM}    timeout=60        error=None
    Click Element                    ${TIPO_BEM}    modifier=False

    Wait Until Element Is Visible    ${$_PRECATORIOS}    timeout=60        error=None
    Click Element                    ${$_PRECATORIOS}    modifier=False

    Wait Until Element Is Visible    ${TP_PRECATORIO}    timeout=60    error=None
    Select From List By Value        ${TP_PRECATORIO}    0

    Wait Until Element Is Visible    ${NUM_PRECATORIO}    timeout=60    error=None
    Input Text                       ${NUM_PRECATORIO}    7878787

    Wait Until Element Is Visible    ${OBS_PRECATORIO}    timeout=60     error=None
    Input Text                       ${OBS_PRECATORIO}    ${CMP_OBS} 

    Wait Until Element Is Visible    ${VLR_PRECATORIO}    timeout=60    error=None
    Input Text                       ${VLR_PRECATORIO}    50000000

    Wait Until Element Is Visible    ${BTN_CADASTRAR}    timeout=60        error=None
    Click Element                    ${BTN_CADASTRAR}    modifier=False