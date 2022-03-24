*** Settings ***

#Library    keyword.py

***Keywords***

Ativo Casa

    Wait Until Page Contains         Bens e Direitos    timeout=60        error=None    
    Wait Until Element Is Visible    ${CAD_BENS}        timeout=60        error=None
    Click Element                    ${CAD_BENS}        modifier=False


    Wait Until Element Is Visible    ${TIPO_BEM}    timeout=60        error=None
    Click Element                    ${TIPO_BEM}    modifier=False

    Wait Until Element Is Enabled    ${$_CASA}    timeout=60    error=None
    Select From List By Value        ${$_CASA}    1

#---Endereço---
    Wait Until Element Is Visible    ${CASA_CEP}    timeout=60    error=None
    Input Text                       ${CASA_CEP}    80030-025

    Wait Until Element Is Visible    ${BTN_LUPA}    timeout=60        error=None
    Click Element                    ${BTN_LUPA}    modifier=False

    Wait Until Element Is Visible    ${CASA_CARTORIO}    timeout=60    error=None

    Wait Until Element Is Visible    id=pt1:formCasa:itCasaComplementoLogradouro::content    timeout=None             error=None
    Input Text                       id=pt1:formCasa:itCasaComplementoLogradouro::content    Complemento Automação    

    Wait Until Element Is Visible    ${LOGRADOURO}                                                 timeout=60    error=None
    Input Text                       xpath=//input[@name='pt1:formCasa:itCasaNumeroLogradouro']    103
    Press Keys                       ${LOGRADOURO}                                                 ENTER

#---Dados do Bem---
    Wait Until Element Is Visible    ${TERRENO}    timeout=60    error=None
    Input Text                       ${TERRENO}    450

    Wait Until Element Is Visible    ${A_CONSTRUIDA}    timeout=60    error=None
    Input Text                       ${A_CONSTRUIDA}    400

    Wait Until Element Is Visible    ${IND_FISCAL}    timeout=60    error=None
    Input Text                       ${IND_FISCAL}    45565

    Wait Until Element Is Visible    ${CASA_MATRICULA}    timeout=60    error=None
    Input Text                       ${CASA_MATRICULA}    66988

    Scroll Page To Location    0    2000

    Wait Until Element Is Visible    ${FINANCIAMENTO}       timeout=60        error=None    
    Click Element                    ${RD_FINANCIAMENTO}    modifier=False    

    Wait Until Element Is Visible    ${FRACAO_IDEAL}    timeout=60        error=None
    Click Element                    ${FRACAO_IDEAL}    modifier=False

    Wait Until Element Is Visible    id=pt1:formCasa:soc53::content    timeout=None    error=None
    Select From List By Value        id=pt1:formCasa:soc53::content    46
    Wait Until Element Contains      id=pt1:formCasa:soc53::content    CURITIBA        timeout=60    error=None

    Wait Until Element Contains      ${CASA_CARTORIO}    2º REGISTRO DE IMOVEIS - CURITIBA    timeout=60    error=None
    Wait Until Element Is Enabled    ${CASA_CARTORIO}    timeout=60                           error=None
    Click Element                    ${CASA_CARTORIO}    modifier=False
    Select From List By Value        ${CASA_CARTORIO}    1

    Wait Until Element Is Visible    id=pt1:formCasa:itCasaObservacoes::content    timeout=60                                               error=None
    Input Text                       id=pt1:formCasa:itCasaObservacoes::content    Campo Observação Casa Não Obrigatório Automação Ralph

    Wait Until Element Is Visible    id=pt1:formCasa:itCasaValorDeclarado::content    timeout=60    error=None
    Input Text                       id=pt1:formCasa:itCasaValorDeclarado::content    500.000,00

    Wait Until Element Is Enabled    id=pt1:b4    timeout=60        error=None
    Click Element                    id=pt1:b4    modifier=False