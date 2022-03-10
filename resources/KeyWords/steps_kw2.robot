*** Settings ***
Resource    ../base.robot

#Library    keyword.py


***Keywords***
#----Login----
Dado que acesso a página login
    #Acesso Login
    Go To    ${BASE_URL}

E acesso título itcmdSobre
    #Localizando a Page /itcmdSobre
    Wait Until Element Is Visible    ${FAZER_DECLARAÇÃO}    timeout=60        error=None
    Click Element                    ${FAZER_DECLARAÇÃO}    modifier=False
    Wait Until Element Is Visible    ${ACESSAR}             timeout=60        error=None
    Click Element                    ${ACESSAR}             modifier=False

Quando logo com a minha credencial
    #Informando dados de usuário
    Wait Until Element Is Visible    ${LGN_USUARIO}    timeout=60        error=None
    Click Element                    ${LGN_USUARIO}    modifier=False
    Input Text                       ${LGN_USUARIO}    ${USR_CPF}

    #Informando dados de senha
    Wait Until Element Is Visible    ${LGN_SENHA}    timeout=60    error=None

    Click Element    ${LGN_SENHA}    modifier=False
    Input Text       ${LGN_SENHA}    ${USR_SENHA}

    #Clicar em Acessar
    Wait Until Element Is Enabled    ${BTN_ACESSAR}    timeout=60    error=None
    Double Click Element             ${BTN_ACESSAR}

    Então valido usuário logado


#---Criar declaração de Doação por Escritura Pública---

Dado que envio uma declaração de doação por escritura pública

    Wait Until Element Is Enabled    ${LGN_DECLARAÇÃO}    timeout=60    error=None    
    Element Should Be Enabled        ${LGN_DECLARAÇÃO}
    Click Element At Coordinates     ${LGN_DECLARAÇÃO}    147           19            
    Click Element                    ${LGN_DECLARAÇÃO}    

    Page Should Contain    Art. 299 - Omitir,

    Wait Until Element Is Visible    ${CAMPO_TEL}    timeout=60    error=None    

    Wait Until Element Is Visible    ${CAMPO_LOGR}    timeout=60    error=None    

    Wait Until Element Is Visible    ${CHK_299}    timeout=60        error=None 
    Click Element                    ${CHK_299}    modifier=False

    Page Should Contain    299 do Código Penal:    

    Wait Until Element Is Visible    ${BTN_INICIAR}    timeout=60    error=None
    Click Element                    ${BTN_INICIAR}    

E tenho um doador e donatário válidos para escritura

    Wait Until Element Is Visible    ${DESEJO}    timeout=60             error=None
    Element Text Should Be           ${DESEJO}    O que deseja fazer?

    Click Element    ${NOVA_DECL}    modifier=False

    Wait Until Element Is Visible    ${TIPO_TRANS}    timeout=60    error=None
    Click Element                    ${BTN_DOACAO}

    Page Should Contain    Qual a modalidade?       loglevel=TRACE
    Page Should Contain    Por Escritura Pública    loglevel=TRACE


    Scroll Page To Location    0                  2000
    Select Radio Button        ${RADIO_DOACAO}    0

#---Informando dos do Cartório - Escritura Pública---
    Wait Until Element Is Visible    ${CAD_UF}    timeout=60        error=None    
    Select From List By Value        ${CAD_UF}    17
    Click Element                    ${CAD_UF}    modifier=False

    Wait Until Element Is Visible    ${CD_MUNICIPIO}    timeout=60        error=None
    Select From List By Value        ${CD_MUNICIPIO}    95
    Wait Until Element Contains      ${CD_MUNICIPIO}    CURITIBA          timeout=60    error=None
    Click Element                    ${CD_MUNICIPIO}    modifier=False    

    Wait Until Element Is Visible    ${CD_CARTORIO}       timeout=60                   error=None
    Select From List By Value        ${CD_CARTORIO}       20                           
    Wait Until Element Contains      ${COMBO_CARTORIO}    JUNTA COMERCIAL DO PARANA    timeout=60    error=None

#----Tipo Doação----
    Scroll Page To Location          0                         2000
    Wait Until Element is Visible    ${DOACAO_PLENA}           timeout=60    error=None
    Page Should Contain              Qual o tipo de doação?
    Select Radio Button              ${DOACAO_PLENA}           0

    Scroll Page To Location          0                    2000
    Wait Until Element Is Enabled    ${BTN_PROSSEGUIR}    timeout=20    error=None
    Double Click Element             ${BTN_PROSSEGUIR}


#------Tela Lista Partes------#
    #TRANSMITENTE - DOADOR
    Scroll Page To Location          0                     2000
    Wait Until Element Is Visible    ${CAD_TRANSMIT}       timeout=60        error=None
    Page Should Contain              Pessoas Envolvidas    loglevel=TRACE
    Click Element                    ${CAD_TRANSMIT}

    Wait Until Element Is Visible    ${CMP_CPF}     timeout=60    error=None
    Input Text                       ${NUM_CPF}     ${CPF_1}
    Double Click Element             ${LUPA_CPF}

    Wait Until Element Is Visible    ${CMP_TEL}       timeout=60        error=None
    Page Should Contain              Nome Completo    loglevel=TRACE
    Input Text                       ${CMP_TEL}       ${TELEFONE}
    Input Text                       ${CMP_EMAIL}     ${EMAIL}
    Input Text                       ${CMP_CEP}       ${CEP}

    Wait Until Element Is Enabled    ${LUPA_CEP}    timeout=60    error=None
    Double Click Element             ${LUPA_CEP}

    Scroll Page To Location          0                   2000
    Wait Until Element Is Visible    ${LOGR}             timeout=60    error=None
    Page Should Contain              Endereço
    Input Text                       ${LOGR}             100
    Double Click Element             ${PARTES_SALVAR}

    #DONATÁRIO
    Wait Until Element Is Visible    ${CAD_BENFICIARIO}    timeout=60        error=None
    Page Should Contain              Pessoas Envolvidas    loglevel=TRACE
    Scroll Page To Location          0                     2000
    Click Element                    ${CAD_BENFICIARIO}
    Wait Until Element Is Visible    ${CMP_CPF}            timeout=60
    Input Text                       ${NUM_CPF}            ${CPF_2}
    Double Click Element             ${LUPA_CPF}


    Wait Until Element Is Visible    ${CMP_TEL}       timeout=60        error=None
    Page Should Contain              Nome Completo    loglevel=TRACE
    Input Text                       ${CMP_TEL}       ${TELEFONE}
    Input Text                       ${CMP_EMAIL}     ${EMAIL}
    Input Text                       ${CMP_CEP}       ${CEP}

    Wait Until Element Is Enabled    ${LUPA_CEP}    timeout=60    error=None
    Double Click Element             ${LUPA_CEP}


    Scroll Page To Location          0                   2000
    Wait Until Element Is Visible    ${LOGR}             timeout=60    error=None
    Page Should Contain              Endereço
    Input Text                       ${LOGR}             100
    Double Click Element             ${PARTES_SALVAR}


    Wait Until Element is Visible    ${BTN_SAV_PARTES}                             timeout=60        error=None
    Page Should Contain              RALPH DA SILVA SOUZA                          loglevel=TRACE
    Page Should Contain              LAURA MARIA FARIA ANTONIALI LEAL DE BRITTO    loglevel=TRACE

    Double Click Element    ${BTN_SAV_PARTES}

Quando insiro o Bem Dinheiro em Espécie - Moeda Nacional

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

    Wait Until Element Is Visible    ${BTN_SAV_BENS}    timeout=60        error=None
    Click Element                    ${BTN_SAV_BENS}    modifier=False    

E partilho o valor do bem
    Scroll Page To Location    0    2000

    Wait Until Element Is Visible    ${PERC_%}    timeout=60    error=None
    Press Keys                       ${PERC_%}    BACKSPACE
    Press Keys                       ${PERC_%}    100
    Press Keys                       ${PERC_%}    ENTER

    Wait Until Element Is Visible    ${BTN_SAV_PERC}    timeout=60    error=None
    Double Click Element             ${BTN_SAV_PERC}


Então devo observar os valores informados obtendo o nº da declaração da escritura

    Wait Until Element Is Visible    ${FG_TRASMIT}                  timeout=60        error=None
    Page Should Contain              Fato Gerador - Doação Plena    loglevel=TRACE
    Page Should Contain              AÇÃO NECESSÁRIA:               loglevel=TRACE

    Page Should Contain Element    ${FG_TRASMIT}
    Page Should Contain Element    ${FG_PERC}
    Scroll Page To Location        0                2000
    Page Should Contain Element    ${FG_TOTAL}


    Wait Until Element Contains    ${FG_CALC}    CALCULAR FATO GERADOR    timeout=60    error=None
    Double Click Element           ${FG_CALC}

    Wait Until Page Contains Element    ${FG_PAGAR}     timeout=60    error=None
    Double Click Element                ${FG_SALVAR}

#----Anexar Documentos em PDF para LI de ANEXOS----

#Dados Gerais - Petição Inicial

    Wait Until Element Is Visible    ${ABA_DADOS}       timeout=60     error=None
    Choose File                      ${ANEXO_GERAL3}    ${FILE}
    Wait Until Element Contains      ${PAINEL4}         ${NOME_PDF}    timeout=60    error=None

    Scroll Page To Location    0    2000

    Wait Until Element Is Enabled    ${BTN_SALVAR}    timeout=60        error=None
    Click Element                    ${BTN_SALVAR}    modifier=False


    #TELA DE ENVIO
    Wait Until Element Is Visible    ${BTN_ENVIO}    timeout=60        error=None    
    Page Should Contain              ${TXT_ENVIO}    loglevel=TRACE

    Wait Until Element Is Enabled    ${BTN_ENVIO}    timeout=60    error=None    
    Double Click Element             ${BTN_ENVIO}


    Wait Until Element Contains    ${ENV_SUCESSO}    ${MSG_ENVIO}    timeout=60    error=None


    ${number}    Get Text     ${NUM_DECL}
    Log          ${number}

    End Test