*** Settings ***
Resource    ../base.robot
Resource    ../Page_Objects/Bens/Precatorios.robot

#Library    keyword.py


***Keywords***
#----Login----
Dado que acesso a página login
    #Acesso Login
    Go To    ${BASE_URL}

E acesso título itcmdSobre
    #Localizando a Page /itcmdSobre
    Wait Until Element Is Visible    ${FAZER_DECLARAÇÃO}    timeout=30        error=None
    Double Click Element             ${FAZER_DECLARAÇÃO}    
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
    Wait Until Element Is Enabled    ${BTN_ACESSAR}    timeout=30    error=None
    Double Click Element             ${BTN_ACESSAR}

    Então valido usuário logado    

#----Criar declaração Doação com ATIVO Precatório----#
Dado que inicio uma declaração de doação precatório

    Wait Until Element Is Enabled    ${LGN_DECLARAÇÃO}    timeout=60    error=None    
    Element Should Be Enabled        ${LGN_DECLARAÇÃO}
    Press Keys                       ${LGN_DECLARAÇÃO}    ENTER         
    Double Click Element             ${LGN_DECLARAÇÃO}    

    Wait Until Page Contains    Art. 299 - Omitir,    timeout=60    error=None

    Wait Until Element Is Visible    ${CAMPO_TEL}    timeout=30    error=None    
    #Double Click Element             ${CAMPO_TEL}
    #Input Text                       ${CAMPO_TEL}    ${TELEFONE}

    Wait Until Element Is Visible    ${CAMPO_LOGR}    timeout=30    error=None    
    #Click Element                    ${CAMPO_LOGR}    modifier=False
    #Input Text                       ${CAMPO_LOGR}    Robô Ralph

    Wait Until Element Is Visible    ${CHK_299}    timeout=30        error=None 
    Click Element                    ${CHK_299}    modifier=False

    Page Should Contain    299 do Código Penal:

    #Wait Until Element Is Visible    ${CHK_299}
    #Select Checkbox                  ${CHK_299}
    #Checkbox Should Be Selected      ${CHK_299}
    #Click Element                    ${CHK_299}

    Wait Until Element Is Visible    ${BTN_INICIAR}    timeout=30         error=None
    Click Element                    ${BTN_INICIAR}    #modifier=False

E tenho doador e donatário válidos para malha

    Wait Until Element Is Visible    ${DESEJO}    timeout=30             error=None
    Element Text Should Be           ${DESEJO}    O que deseja fazer?

    Click Element    ${NOVA_DECL}    modifier=False

    Wait Until Element Is Visible    ${TIPO_TRANS}    timeout=30    error=None
    Click Element                    ${BTN_DOACAO}

    Page Should Contain    Qual a modalidade?       loglevel=TRACE
    Page Should Contain    Por Escritura Pública    loglevel=TRACE


    Scroll Page To Location    0                  2000
    Select Radio Button        ${RADIO_DOACAO}    0

#---Informando dos do Cartório - Escritura Pública---
    Wait Until Element Is Visible    ${CAD_UF}    timeout=30        error=None    
    Select From List By Value        ${CAD_UF}    17
    Click Element                    ${CAD_UF}    modifier=False

    Wait Until Element Contains         ${CD_MUNICIPIO}    CURITIBA      timeout=30                         error=None 
    Wait Until Page Contains Element    ${CD_MUNICIPIO}    timeout=30    error=Não Localiza CD Município    
    Select From List By Value           ${CD_MUNICIPIO}    95


    Wait Until Element Is Visible    ${CD_CARTORIO}       timeout=30                   error=None
    Select From List By Value        ${CD_CARTORIO}       20                           
    Wait Until Element Contains      ${COMBO_CARTORIO}    JUNTA COMERCIAL DO PARANA    timeout=30    error=None

#----Tipo Doação----
    Scroll Page To Location          0                         2000
    Wait Until Element is Visible    ${DOACAO_PLENA}           timeout=30    error=None
    Page Should Contain              Qual o tipo de doação?
    Select Radio Button              ${DOACAO_PLENA}           0

    Scroll Page To Location          0                    2000
    Wait Until Element Is Enabled    ${BTN_PROSSEGUIR}    timeout=10    error=None
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
    Wait Until Element Is Visible    ${CMP_CPF}            timeout=30
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


    Wait Until Element is Visible    ${BTN_SAV_PARTES}                             timeout=30        error=None
    Page Should Contain              RALPH DA SILVA SOUZA                          loglevel=TRACE
    Page Should Contain              LAURA MARIA FARIA ANTONIALI LEAL DE BRITTO    loglevel=TRACE

    Double Click Element    ${BTN_SAV_PARTES}

Quando insiro o Bem Precatórios

    Ativo Precatório

E partilho o valor do bem

    Scroll Page To Location    0    2000

    Wait Until Element Is Visible    ${PERC_%}    timeout=30    error=None
    Press Keys                       ${PERC_%}    BACKSPACE
    Press Keys                       ${PERC_%}    100
    Press Keys                       ${PERC_%}    ENTER

    Wait Until Element Is Visible    ${BTN_SAV_PERC}    timeout=30    error=None
    Double Click Element             ${BTN_SAV_PERC}

E obtenho os valores calculados do fato gerador

    Wait Until Element Is Visible    ${FG_TRASMIT}                  timeout=30        error=None
    Page Should Contain              Fato Gerador - Doação Plena    loglevel=TRACE
    Page Should Contain              AÇÃO NECESSÁRIA:               loglevel=TRACE

    Page Should Contain Element    ${FG_TRASMIT}
    Page Should Contain Element    ${FG_PERC}
    Scroll Page To Location        0                2000
    Page Should Contain Element    ${FG_TOTAL}


    Wait Until Element Contains    ${FG_CALC}    CALCULAR FATO GERADOR    timeout=30    error=None
    Double Click Element           ${FG_CALC}

    Wait Until Page Contains Element    ${FG_PAGAR}     timeout=30    error=None
    Double Click Element                ${FG_SALVAR}

#----Anexar Documentos em PDF para LI de ANEXOS----

E anexo os arquivos correspondentes

#---- Anexo Petição Inicial----
    Wait Until Element Is Visible    ${ABA_DADOS}       timeout=30     error=None
    Choose File                      ${ANEXO_GERAL3}    ${FILE}
    Wait Until Element Contains      ${PAINEL4}         ${NOME_PDF}    timeout=30    error=None

#----Anexo Extrato Precatório Federal----
    Wait Until Element Is Enabled    ${ABA_BENS}    timeout=30        error=None
    Click Element                    ${ABA_BENS}    modifier=False
    Wait Until Element Contains      ${PAINEL6}     ${TITULO_PREC}    timeout=30    error=None

    Choose File                    ${ANEXO_BENS}    ${FILE}        
    Wait Until Element Contains    ${PAINEL6}       ${NOME_PDF}    timeout=30    error=None    

    Wait Until Element Is Enabled    ${BTN_SALVAR}    timeout=30         error=None
    Click Element                    ${BTN_SALVAR}    modifier=False 

Então devo obter os valores junto ao número da declaração e informação da malha

 #TELA DE ENVIO
    Wait Until Element Is Visible    ${BTN_ENVIO}    timeout=30    error=None                    
    Wait Until Page Contains         ${TXT_ENVIO}    timeout=30    error=Não localizado texto

    Scroll Page To Location    0    2000

    Wait Until Element Is Enabled    ${BTN_ENVIO}         timeout=30        error=None
    Current Frame Should Contain     ENVIAR DECLARAÇÃO    loglevel=TRACE
    Click Element                    ${BTN_ENVIO}         modifier=False    


    Wait Until Element Contains    ${ENV_SUCESSO}    ${MSG_ENVIO}    timeout=30    error=None    
    Wait Until Page Contains       ${MSG_MALHA}      timeout=60      error=None


    ${number}    Get Text     ${NUM_DECL}
    Log          ${number}

    End Test 






