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

#----Criar declaração Divórcio Cartório----

Dado que estou logado como contribuinte

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

E informo modalidade divórcio

    Wait Until Element Is Visible    ${DESEJO}    timeout=60             error=None
    Element Text Should Be           ${DESEJO}    O que deseja fazer?

    Click Element    ${NOVA_DECL}    modifier=False

    Wait Until Element Is Visible    ${TIPO_TRANS}      timeout=60    error=None
    Click Element                    ${BTN_DIVORCIO}    

    Page Should Contain    Qual a modalidade?    loglevel=TRACE
    Page Should Contain    Cartório              loglevel=TRACE

    Wait Until Element Is Visible    ${RD_DIVORCIO}    timeout=60        error=None
    Click Element                    ${RD_DIVORCIO}    modifier=False

Quando preencho a lista de itens dos Dados Gerais

    Scroll Page To Location    0    2000 

    Wait Until Element Is Visible    ${CAD_UF}    timeout=60    error=None    
    Select From List By Value        ${CAD_UF}    17
    Wait Until Element Contains      ${CAD_UF}    PR            timeout=60    error=None

    Wait Until Element Is Visible    ${CD_MUNICIPIO}    timeout=60        error=None
    Click Element                    ${CD_MUNICIPIO}    modifier=False    
    Select From List By Value        ${CD_MUNICIPIO}    95                
    Wait Until Element Contains      ${CD_MUNICIPIO}    CURITIBA          timeout=60    error=None

    Wait Until Element Is Visible    id=pt1:socCodReparticao::content    timeout=60        error=None
    Click Element                    id=pt1:socCodReparticao::content    modifier=False
    Select From List By Value        id=pt1:socCodReparticao::content    1

    Wait Until Element Is Visible    id=pt1:btnSobrepartilhaNao    timeout=60        error=None
    Click Element                    id=pt1:btnSobrepartilhaNao    modifier=False

    Wait Until Element Is Visible    ${BTN_SALVAR}    timeout=30    error=None

E clico em Salvar e Prosseguir, sou encaminhado para lista de Pessoas

    Wait Until Element Is Visible    ${BTN_SALVAR}    timeout=30    error=None
    Double Click Element             ${BTN_SALVAR}

    Scroll Page To Location          0                    2000
    Wait Until Element Is Enabled    ${BTN_PROSSEGUIR}    timeout=30    error=NoneF
    Double Click Element             ${BTN_PROSSEGUIR}

Então observo o usuário encaminhado à /itcmdListaPartes

    Scroll Page To Location          0                     2000
    Wait Until Element Is Visible    ${CAD_DIVORCIO}       timeout=60    error=None
    Wait Until Page Contains         Pessoas Envolvidas    timeout=60    error=None

Dado que clico em Cadastrar Pessoa

    Wait Until Element Is Visible    ${CAD_DIVORCIO}    timeout=60        error=None
    Click Element                    ${CAD_DIVORCIO}    modifier=False

E informo CPF dos divorciandos válidos
#----Primeiro divorciando----
    Wait Until Element Is Visible    ${CMP_CPF}     timeout=60    error=None
    Input Text                       ${NUM_CPF}     ${CPF_3}
    Double Click Element             ${LUPA_CPF}


    Wait Until Element Is Visible    ${CMP_TEL}
    Page Should Contain              Nome Completo    loglevel=TRACE
    Input Text                       ${CMP_TEL}       ${TELEFONE}
    Input Text                       ${CMP_EMAIL}     ${EMAIL}
    Input Text                       ${CMP_CEP}       ${CEP}
    Wait Until Element Is Visible    ${LUPA_CEP}      timeout=60        error=None
    Double Click Element             ${LUPA_CEP}

    Scroll Page To Location          0                   2000
    Wait Until Element Is Visible    ${LOGR}             timeout=60    error=None
    Page Should Contain              Endereço
    Input Text                       ${LOGR}             100
    Double Click Element             ${PARTES_SALVAR}

#----Segundo Divorciando----
    Wait Until Element Is Visible    ${CAD_DIVORCIO}    timeout=60        error=None
    Click Element                    ${CAD_DIVORCIO}    modifier=False

    Wait Until Element Is Visible    ${CMP_CPF}     timeout=60    error=None
    Input Text                       ${NUM_CPF}     ${CPF_4}
    Double Click Element             ${LUPA_CPF}

    Wait Until Element Is Visible    ${CMP_TEL}
    Page Should Contain              Nome Completo    loglevel=TRACE
    Input Text                       ${CMP_TEL}       ${TELEFONE}
    Input Text                       ${CMP_EMAIL}     ${EMAIL}
    Input Text                       ${CMP_CEP}       ${CEP}

    Wait Until Element Is Visible    ${LUPA_CEP}    timeout=60    error=None
    Double Click Element             ${LUPA_CEP}


    Scroll Page To Location          0                   2000
    Wait Until Element Is Visible    ${LOGR}             timeout=60    error=None
    Wait Until Element Is Visible    ${LOGR}
    Page Should Contain              Endereço
    Input Text                       ${LOGR}             100
    Double Click Element             ${PARTES_SALVAR}

Quando retorno a tela /itcmdListaPartes observo os nomes cadastrados

    Wait Until Page Contains         ${CPF_3}             timeout=60    error=None
    Wait Until Page Contains         ${CPF_4}             timeout=60    error=None
    Wait Until Element is Visible    ${BTN_SAV_PARTES}

    ${name1}    Get Text    ${NOME_PARTE1}
    Log         ${name1}

    ${name2}    Get Text    ${NOME_PARTE2}
    Log         ${name2}

E observo o botão Salva e Prosseguir habilitado

    Wait Until Element Is Enabled    ${BTN_SAV_PARTES}      timeout=60    error=None
    Wait Until Page Contains         SALVAR E PROSSEGUIR    timeout=60    error=None    

Então clico no botão, prosseguindo para tela /itcmdListaBens

    Wait Until Element Is Enabled    ${BTN_SAV_PARTES}      timeout=60    error=None
    Wait Until Page Contains         SALVAR E PROSSEGUIR    timeout=60    error=None 
    Double Click Element             ${BTN_SAV_PARTES}      

    Wait Until Page Contains         Bens e Direitos    timeout=60    error=None    
    Wait Until Element Is Visible    ${CAD_BENS}        timeout=60    error=None

