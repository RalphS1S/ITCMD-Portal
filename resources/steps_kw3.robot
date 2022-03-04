*** Settings ***
Resource    base.robot

#Library    keyword.py


***Keywords***
#----Login----
Dado que acesso a página login
    #Acesso Login
    Go To    ${BASE_URL}

E acesso título itcmdSobre
    #Localizando a Page /itcmdSobre
    Wait Until Element Is Visible    ${FAZER_DECLARAÇÃO}
    Click Element                    ${FAZER_DECLARAÇÃO}    modifier=False
    Wait Until Element Is Visible    ${ACESSAR}             timeout=None      error=None
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
    Page Should Contain    Olá, ${full_name_login}


#----Criar declaração Divórcio----#

Dado que inicio uma declaração de divórcio judicial

    Wait Until Element Is Enabled    ${LGN_DECLARAÇÃO}    timeout=60    error=None    
    Element Should Be Enabled        ${LGN_DECLARAÇÃO}
    Click Element At Coordinates     ${LGN_DECLARAÇÃO}    147           19            
    Click Element                    ${LGN_DECLARAÇÃO}    

    Page Should Contain    Art. 299 - Omitir,

    Wait Until Element Is Visible    ${CAMPO_TEL}    timeout=60    error=None    
    #Double Click Element             ${CAMPO_TEL}
    #Input Text                       ${CAMPO_TEL}    ${TELEFONE}

    Wait Until Element Is Visible    ${CAMPO_LOGR}    timeout=60    error=None    
    #Click Element                    ${CAMPO_LOGR}    modifier=False
    #Input Text                       ${CAMPO_LOGR}    Robô Ralph

    Wait Until Element Is Visible    ${CHK_299}    timeout=60        error=None 
    Click Element                    ${CHK_299}    modifier=False

    Page Should Contain    299 do Código Penal:

    #Wait Until Element Is Visible    ${CHK_299}
    #Select Checkbox                  ${CHK_299}
    #Checkbox Should Be Selected      ${CHK_299}
    #Click Element                    ${CHK_299}

    Wait Until Element Is Visible    ${BTN_INICIAR}    timeout=60         error=None
    Click Element                    ${BTN_INICIAR}    #modifier=False


E tenho um divorciado e divorciando válidos

    Wait Until Element Is Visible    ${DESEJO}    timeout=60             error=None
    Element Text Should Be           ${DESEJO}    O que deseja fazer?

    Click Element    ${NOVA_DECL}    modifier=False

    Wait Until Element Is Visible    ${TIPO_TRANS}      timeout=60    error=None
    Click Element                    ${BTN_DIVORCIO}    

    Page Should Contain    Qual a modalidade?    loglevel=TRACE
    Page Should Contain    Cartório              loglevel=TRACE

    Scroll Page To Location    0                    2000 
    Click Element              ${RD_DIVJUDICIAL}    modifier=False

    Wait Until Element Is Visible    ${DT_SENTENÇA}    timeout=60    error=None
    Input Text                       ${DT_SENTENÇA}    01/10/2021
    #Wait Until Element Is Visible    ${BTN_SETA}                                        timeout=None    error=None

    Scroll Page To Location    0                                                  2000 
    Execute JavaScript         document.getElementById('pt1:b3::icon').click()



    Wait Until Element Is Visible    ${BTN_PROJUDN}    timeout=60         error=None
    Page Should Contain              É Projudi?        loglevel=TRACE
    Click Element                    ${BTN_PROJUDN}    modifier=False 

    Scroll Page To Location    0    2000 

    Wait Until Element Is Visible    ${BTN_SETA1}    timeout=60        error=None
    Input Text                       ${NUM_AUTOS}    45555
    Click Element                    ${BTN_SETA1}    modifier=False

    Wait Until Element Is Visible    ${CAD_UF}    timeout=60        error=None    
    Select From List By Value        ${CAD_UF}    17
    Click Element                    ${CAD_UF}    modifier=False


    Wait Until Element Is Visible    ${CD_MUNICIPIO}    timeout=60    error=None
    Select From List By Value        ${CD_MUNICIPIO}    95
    Wait Until Element Contains      ${CD_MUNICIPIO}    CURITIBA      timeout=60    error=None    


    Wait Until Element Is Visible    ${JUIZO_DIV}    timeout=none           error=None
    Sleep                            1s              
    Input Text                       ${JUIZO_DIV}    JuizoAutomaçãoRalph

    Wait Until Element Is Visible    ${BTN_SETA2}    timeout=none    error=None
    Double Click Element             ${BTN_SETA2}    

    Wait Until Element Is Visible    ${SOBREPART_N}    timeout=60        error=None
    Click Element                    ${SOBREPART_N}    modifier=False

    Wait Until Element Is Visible    ${ALVARA_N}    timeout=60        error=None
    Wait Until Element Is Enabled    ${ALVARA_N}    timeout=60        error=None
    Click Element                    ${ALVARA_N}    modifier=False

    Wait Until Element Is Visible    ${BTN_SALVAR}    timeout=60    error=None
    Wait Until Element Is Enabled    ${BTN_SALVAR}    timeout=60    error=Botão "Salvar" sem ação
    Scroll Page To Location          0                2000 
    Double Click Element             ${BTN_SALVAR}


    Wait Until Element Is Visible    ${CAD_DIVORCIO}    timeout=60    error=None

    Page Should Contain    Pessoas Envolvidas    

#---Inclusão Divorciondo---#

    Wait Until Element Is Visible    ${CAD_DIVORCIO}    timeout=60        error=None
    Click Element                    ${CAD_DIVORCIO}    modifier=False

    Wait Until Element Is Visible    ${CMP_CPF}     timeout=60    error=None
    Input Text                       ${NUM_CPF}     ${CPF_1}
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

#---Inclusão Divorciado---#

    Wait Until Element Is Visible    ${CAD_DIVORCIO}    timeout=60        error=None
    Click Element                    ${CAD_DIVORCIO}    modifier=False

    Wait Until Element Is Visible    ${CMP_CPF}     timeout=60    error=None
    Input Text                       ${NUM_CPF}     ${CPF_2}
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


    Wait Until Element is Visible    ${BTN_SAV_PARTES}
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

    Wait Until Element Is Visible    ${BTN_SAV_BENS}    timeout=60         error=None
    Click Element                    ${BTN_SAV_BENS}    modifier=False 

E partilho o valor do bem

#----Percentual para o primeiro Divorciando-----#
    Scroll Page To Location          0            2000
    #Page Should Contain              Dinheiro em Espécie - Moeda Nacional    loglevel=TRACE
    Wait Until Element Is Visible    ${PERC_%}    timeout=None    error=None
    Press Keys                       ${PERC_%}    BACKSPACE
    Press Keys                       ${PERC_%}    50
    Press Keys                       ${PERC_%}    ENTER

    #Page Should Contain    Demonstrativo de cálculo    loglevel=TRACE

#----Percentual para o segundo Divorciando-----#
    Scroll Page To Location          0             2000
    #Page Should Contain              Dinheiro em Espécie - Moeda Nacional    loglevel=TRACE
    Wait Until Element Is Visible    ${PERC2_%}    timeout=60    error=None
    Press Keys                       ${PERC2_%}    BACKSPACE
    Press Keys                       ${PERC2_%}    50
    Press Keys                       ${PERC2_%}    ENTER         

    Wait Until Element Is Visible    ${BTN_SAV_PERC}    timeout=60
    Double Click Element             ${BTN_SAV_PERC}

    Wait Until Element Is Visible    ${BTN_ATENÇÂO}    timeout=60
    Page Should Contain              Atenção           loglevel=TRACE
    Click Element                    ${BTN_ATENÇÂO}    modifier=False

Então devo observar um FG equânime e obter o nº da declaração

    Wait Until Element Is Visible    ${FG_TRASMIT}       timeout=60        error=None
    Wait Until Element Is Visible    ${EQUANIME}         timeout=60        error=None    
    Page Should Contain              AÇÃO NECESSÁRIA:    loglevel=TRACE

    Page Should Contain Element    ${FG_TRASMIT}
    Page Should Contain Element    ${FG_PERC1}
    Scroll Page To Location        0                2000
    Page Should Contain Element    ${FG_TOTAL}


    Wait Until Element Contains    ${FG_CALC}    CALCULAR FATO GERADOR    timeout=60    error=None
    Double Click Element           ${FG_CALC}

    Wait Until Page Contains Element    ${FG_PAGAR}     timeout=60    error=None
    Double Click Element                ${FG_SALVAR}

    #TELA DE ANEXO - Possuí anexo
    Wait Until Element Is Visible    ${ABA_DADOS}    timeout=60        error=None
    Click Element                    ${ABA_DADOS}    modifier=False

    Page Should Contain    Anexos    loglevel=TRACE

    Wait Until Element Is Enabled    ${BNT_ESCOLHER}    timeout=60    error=None    
    #Execute JavaScript               document.getElementById('pt1:iAnexosDG:0:inputFile1::content').click()

#----Anexar Documentos em PDF para LI de ANEXOS----

#Dados Gerais - Petição Inicial
    Choose File                    ${ANEXO_GERAL}    ${FILE}
    Wait Until Element Contains    ${PAINEL}         ${NOME_PDF}    timeout=60    error=None

    Scroll Page To Location    0    2000

#Dados Gerais - Sentença Homologação
    Choose File                    ${ANEXO_GERAL1}    ${FILE}
    Wait Until Element Contains    ${PAINEL1}         ${NOME_PDF}    timeout=60    error=None

#Dados Gerais - Plano Partilha
    Choose File                    ${ANEXO_GERAL2}    ${FILE}
    Wait Until Element Contains    ${PAINEL2}         ${NOME_PDF}    timeout=60    error=None


#---- Aba Pessoas

    Wait Until Element Is Enabled    ${ABA_PESSOAS}    timeout=60        error=None
    Click Element                    ${ABA_PESSOAS}    modifier=False

#Pessoas - Certidão de Casamento ou Comprovação de União Estável
    Choose File                    ${ANEXO_PESSOAS}    ${FILE}
    Wait Until Element Contains    ${PAINEL3}          ${NOME_PDF}    timeout=60    error=None

    Wait Until Element Is Enabled    ${BTN_SALVAR}    timeout=60        error=None
    Click Element                    ${BTN_SALVAR}    modifier=False

 #TELA DE ENVIO
    Wait Until Element Is Visible    ${BTN_ENVIO}      timeout=60        error=None     
    Page Should Contain              ${TXT_ENVIO}      loglevel=TRACE
    
    Wait Until Element Is Visible    ${BTN_ENVIO}      timeout=60        error=None
    Double Click Element             ${BTN_ENVIO}

    Wait Until Element Is Visible    ${ENV_SUCESSO}    timeout=60        error=None 
    Page Should Contain Element      ${ENV_SUCESSO}


    ${number}    Get Text     ${NUM_DECL}
    Log          ${number}

    End Test 

