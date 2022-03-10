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
    Wait Until Element Is Visible    ${FAZER_DECLARAÇÃO}    timeout=30        error=None
    Click Element                    ${FAZER_DECLARAÇÃO}    modifier=False
    Wait Until Element Is Visible    ${ACESSAR}             timeout=30        error=None
    Click Element                    ${ACESSAR}             modifier=False

Quando logo com a minha credencial
    #Informando dados de usuário
    Wait Until Element Is Visible    ${LGN_USUARIO}    timeout=30        error=None
    Click Element                    ${LGN_USUARIO}    modifier=False
    Input Text                       ${LGN_USUARIO}    ${USR_CPF}

    #Informando dados de senha
    Wait Until Element Is Visible    ${LGN_SENHA}    timeout=30    error=None

    Click Element    ${LGN_SENHA}    modifier=False
    Input Text       ${LGN_SENHA}    ${USR_SENHA}

    #Clicar em Acessar
    Wait Until Element Is Visible    ${BTN_ACESSAR}    timeout=30    error=None
    Click Button                     ${BTN_ACESSAR}

    Então valido usuário logado


#----Criar declaração Doação Plena----
Dado que inicio uma declaração de doação ato particular

    Wait Until Element Is Enabled       ${LGN_DECLARAÇÃO}    timeout=60    error=None                                     
    Element Should Be Enabled           ${LGN_DECLARAÇÃO}
    Wait Until Page Contains Element    ${LGN_DECLARAÇÃO}    timeout=30    error=Não localizado botão Fazer Declaração    
    Click Element At Coordinates        ${LGN_DECLARAÇÃO}    147           19                                             
    Double Click Element                ${LGN_DECLARAÇÃO}    

    Page Should Contain    Art. 299 - Omitir,

    Wait Until Element Is Visible    ${CAMPO_TEL}    timeout=30    error=None    

    Wait Until Element Is Visible    ${CAMPO_LOGR}    timeout=30    error=None    

    Wait Until Element Is Visible    ${CHK_299}    timeout=30        error=None 
    Click Element                    ${CHK_299}    modifier=False

    Page Should Contain    299 do Código Penal:    

    Wait Until Element Is Visible    ${BTN_INICIAR}    timeout=30         error=None
    Click Element                    ${BTN_INICIAR}    #modifier=False


E tenho um doador e donatário válidos

    Wait Until Element Is Visible    ${DESEJO}    timeout=30             error=None
    Element Text Should Be           ${DESEJO}    O que deseja fazer?

    Click Element    ${NOVA_DECL}    modifier=False

    Wait Until Element Is Visible    ${TIPO_TRANS}    timeout=30    error=None
    Click Element                    ${BTN_DOACAO}

    Wait Until Page Contains    Qual a modalidade?    timeout=30    error=None     
    Wait Until Page Contains    Por Ato Particular    timeout=30    error=None 


    Scroll Page To Location    0                  2000
    Select Radio Button        ${RADIO_DOACAO}    1

    Wait Until Element is Visible    ${DTA_DOACAO}
    Input Text                       ${DTA_MODALIDADE}    17/12/2019
    Click Element                    ${PROSS_DOACAO}

    Element Should Be Enabled    ${DOACAO_PLENA} 
    Scroll Page To Location      0                         2000
    Page Should Contain          Qual o tipo de doação?
    Select Radio Button          ${DOACAO_PLENA}           0

    Wait Until Element Is Visible    ${BTN_SALVAR}    timeout=30    error=None

    Scroll Page To Location          0                    2000
    Wait Until Element Is Enabled    ${BTN_PROSSEGUIR}    timeout=30    error=NoneF
    Double Click Element             ${BTN_PROSSEGUIR}

#------Tela Lista Partes------#
    #TRANSMITENTE - DOADOR

    Scroll Page To Location          0                     2000
    Wait Until Element Is Visible    ${CAD_TRANSMIT}       timeout=30        error=None
    Page Should Contain              Pessoas Envolvidas    loglevel=TRACE
    Click Element                    ${CAD_TRANSMIT}

    Wait Until Element Is Visible    ${CMP_CPF}     timeout=30    error=None
    Input Text                       ${NUM_CPF}     ${CPF_1}
    Double Click Element             ${LUPA_CPF}

    Wait Until Element Is Visible    ${CMP_TEL}       timeout=30        error=None
    Page Should Contain              Nome Completo    loglevel=TRACE
    Input Text                       ${CMP_TEL}       ${TELEFONE}
    Input Text                       ${CMP_EMAIL}     ${EMAIL}
    Input Text                       ${CMP_CEP}       ${CEP}

    Wait Until Element Is Enabled    ${LUPA_CEP}    timeout=30    error=None
    Double Click Element             ${LUPA_CEP}

    Scroll Page To Location          0                   2000
    Wait Until Element Is Visible    ${LOGR}             timeout=30    error=None
    Page Should Contain              Endereço
    Input Text                       ${LOGR}             100
    Double Click Element             ${PARTES_SALVAR}

    #DONATÁRIO
    Wait Until Element Is Visible    ${CAD_BENFICIARIO}    timeout=30        error=None
    Page Should Contain              Pessoas Envolvidas    loglevel=TRACE
    Scroll Page To Location          0                     2000
    Click Element                    ${CAD_BENFICIARIO}
    Wait Until Element Is Visible    ${CMP_CPF}            timeout=30        error=None
    Input Text                       ${NUM_CPF}            ${CPF_2}
    Double Click Element             ${LUPA_CPF}


    Wait Until Element Is Visible    ${CMP_TEL}       timeout=30        error=None
    Page Should Contain              Nome Completo    loglevel=TRACE
    Input Text                       ${CMP_TEL}       ${TELEFONE}
    Input Text                       ${CMP_EMAIL}     ${EMAIL}
    Input Text                       ${CMP_CEP}       ${CEP}

    Wait Until Element Is Enabled    ${LUPA_CEP}    timeout=30    error=None
    Double Click Element             ${LUPA_CEP}


    Scroll Page To Location          0                   2000
    Wait Until Element Is Visible    ${LOGR}             timeout=30    error=None
    Page Should Contain              Endereço
    Input Text                       ${LOGR}             100
    Double Click Element             ${PARTES_SALVAR}


    Wait Until Element is Visible    ${BTN_SAV_PARTES}
    Page Should Contain              RALPH DA SILVA SOUZA                          loglevel=TRACE
    Page Should Contain              LAURA MARIA FARIA ANTONIALI LEAL DE BRITTO    loglevel=TRACE

    Double Click Element    ${BTN_SAV_PARTES}

Quando insiro o Bem Dinheiro em Espécie - Moeda Nacional

    Wait Until Page Contains         Bens e Direitos    timeout=30        error=None    
    Wait Until Element Is Visible    ${CAD_BENS}        timeout=30        error=None
    Click Element                    ${CAD_BENS}        modifier=False


    Wait Until Element Is Visible    ${TIPO_BEM}    timeout=30        error=None
    Click Element                    ${TIPO_BEM}    modifier=False

    Wait Until Element Is Visible    ${$_MOEDANAC}    timeout=30        error=None
    Click Element                    ${$_MOEDANAC}    modifier=False

    Wait Until Element Is Visible    ${OBS_MOEDA}    timeout=30               error=None
    Input Text                       ${OBS_MOEDA}    observação regressivo
    Input Text                       ${VLR_DECL}     500.000,00

    Wait Until Element Is Visible    ${BTN_SAV_BENS}    timeout=30        error=None
    Click Element                    ${BTN_SAV_BENS}    modifier=False    

E partilho o valor do bem
    Scroll Page To Location    0    2000

    Wait Until Element Is Visible    ${PERC_%}    timeout=30    error=None
    Press Keys                       ${PERC_%}    BACKSPACE
    Press Keys                       ${PERC_%}    100
    Press Keys                       ${PERC_%}    ENTER

    Wait Until Element Is Visible    ${BTN_SAV_PERC}    timeout=30    error=None
    Double Click Element             ${BTN_SAV_PERC}

Então devo observar os valores informados e obter o nº da declaração
    Wait Until Element Is Visible    ${FG_TRASMIT}                  timeout=30        error=None
    Page Should Contain              Fato Gerador - Doação Plena    loglevel=TRACE
    Page Should Contain              AÇÃO NECESSÁRIA:               loglevel=TRACE

    Page Should Contain Element    ${FG_TRASMIT}
    Page Should Contain Element    ${FG_PERC}
    Scroll Page To Location        0                2000
    Page Should Contain Element    ${FG_TOTAL}


    Wait Until Element Contains    ${FG_CALC}    CALCULAR FATO GERADOR    timeout=None    error=None
    Double Click Element           ${FG_CALC}

    Wait Until Page Contains Element    ${FG_PAGAR}     timeout=None    error=None
    Double Click Element                ${FG_SALVAR}

    #TELA DE ANEXO - BEM SEM ANEXO
    Wait Until Page Contains Element    ${NO_ANEXO}     timeout=None    error=None
    Wait Until Element Is Visible       ${ANEXO_SAV}    timeout=None    error=None
    Double Click Element                ${ANEXO_SAV}

    #TELA DE ENVIO
    Wait Until Element Is Visible    ${BTN_ENVIO}    timeout=30    error=None                    
    Wait Until Page Contains         ${TXT_ENVIO}    timeout=30    error=Não localizado texto

    Wait Until Element Is Enabled    ${BTN_ENVIO}    timeout=30    error=None    
    Double Click Element             ${BTN_ENVIO}

    Wait Until Element Contains    ${ENV_SUCESSO}    ${MSG_ENVIO}    timeout=30    error=None


    ${number}    Get Text     ${NUM_DECL}
    Log          ${number}

    End Test