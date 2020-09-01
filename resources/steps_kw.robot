*** Settings ***
Resource    base.robot

#Library    keyword.py


***Keywords***
#----Login----
Dado que acesso a página login
    #Acesso Login
    Go To                               ${BASE_URL}

E acesso título itcmdSobre
    #Localizando a Page /itcmdSobre
    Wait Until Element Is Visible       ${FAZER_DECLARAÇÃO}
    Click Element                       ${FAZER_DECLARAÇÃO}                           modifier=False
    Wait Until Element Is Visible       ${ACESSAR}                                    timeout=None             error=None
    Click Element                       ${ACESSAR}                                    modifier=False

Quando logo com a minha credencial
    #Informando dados de usuário
    Wait Until Element Is Visible       ${LGN_USUARIO}                                timeout=None             error=None
    Click Element                       ${LGN_USUARIO}                                modifier=False
    Input Text                          ${LGN_USUARIO}                                ${USR_CPF}

    #Informando dados de senha
    Wait Until Element Is Visible       ${LGN_SENHA}                                  timeout=None             error=None

    Click Element                       ${LGN_SENHA}                                  modifier=False
    Input Text                          ${LGN_SENHA}                                  ${USR_SENHA}

    #Clicar em Acessar
    Wait Until Element Is Visible       ${BTN_ACESSAR}
    Click Button                        ${BTN_ACESSAR}

Então valido usuário logado
    Page Should Contain                 Olá, ${full_name}

#----Criar declaração Doação Plena----
Dado que envio uma declaração de doação
    Sleep                               15
    Wait Until Element Is Visible       xpath=//div[@id='pt1:b4']/a/span
    Click Element                       ${LGN_DECLARAÇÃO}                             modifier=False

    Page Should Contain                 299 do Código Penal:

    Click Element                       ${CAMPO_TEL}                                  modifier=False
    Input Text                          ${CAMPO_TEL}                                  ${TELEFONE}

    Click Element                       ${CAMPO_LOGR}                                 modifier=False
    Input Text                          ${CAMPO_LOGR}                                 teste qualquer

    Wait Until Element Is Visible       ${CHK_299}
    Click Element                       ${CHK_299}                                    modifier=False

    Page Should Contain                 299 do Código Penal:

    #Wait Until Element Is Visible    ${CHK_299}
    #Select Checkbox                  ${CHK_299}
    #Checkbox Should Be Selected      ${CHK_299}
    #Click Element                    ${CHK_299}

    Wait Until Element Is Visible       ${BTN_INICIAR}                                timeout=None             error=None
    Sleep                               1s
    Click Element                       ${BTN_INICIAR}                                #modifier=False


E tenho um doador e donatário válidos
    Element Text Should Be              ${DESEJO}                                     O que deseja fazer?

    Click Element                       ${NOVA_DECL}                                  modifier=False

    Wait Until Element Is Visible       ${TIPO_TRANS}                                 timeout=None             error=None
    Click Element                       ${BTN_DOACAO}

    Page Should Contain                 Qual a modalidade?                            loglevel=TRACE
    Page Should Contain                 Por Ato Particular                            loglevel=TRACE]


    Scroll Page To Location             0                                             2000
    Select Radio Button                 ${RADIO_DOACAO}                               1
    #Click Element                    xpath=//*[@id="pt1:sorTipoRegistro:_1"]
    Wait Until Element is Visible       ${DTA_DOACAO}
    Input Text                          ${DTA_MODALIDADE}                             17/12/2019
    Click Element                       ${PROSS_DOACAO}
    Sleep                               1s

    Scroll Page To Location             0                                             2000
    Page Should Contain                 Qual o tipo de doação?
    Select Radio Button                 ${DOACAO_PLENA}                               0

    Wait Until Element Is Visible       ${BTN_SALVAR}                                 timeout=None             error=None
    #Click Element                   xpath=//*[@id='pt1:btnSalvarProsseguir']           modifier=False
    Sleep                               1s
    Scroll Page To Location             0                                             2000
    Double Click Element                ${BTN_PROSSEGUIR}

#------Tela Lista Partes------#
    #TRANSMITENTE - DOADOR
    Scroll Page To Location             0                                             2000
    Page Should Contain                 Pessoas Envolvidas                            loglevel=TRACE
    Click Element                       ${CAD_TRANSMIT}

    Wait Until Element Is Visible       ${CMP_CPF}                                    timeout=None             error=None
    Input Text                          ${NUM_CPF}                                    ${CPF_1}
    Double Click Element                ${LUPA_CPF}

    Page Should Contain                 Nome Completo                                 loglevel=TRACE
    Input Text                          ${CMP_TEL}                                    ${TELEFONE}
    Input Text                          ${CMP_EMAIL}                                  ${EMAIL}
    Input Text                          ${CMP_CEP}                                    ${CEP}
    Sleep                               1s
    Double Click Element                ${LUPA_CEP}
    Sleep                               1s
    Scroll Page To Location             0                                             2000
    Page Should Contain                 Endereço
    Input Text                          ${LOGR}                                       100
    Double Click Element                ${PARTES_SALVAR}

    #DONATÁRIO
    Page Should Contain                 Pessoas Envolvidas                            loglevel=TRACE
    Scroll Page To Location             0                                             2000
    Click Element                       ${CAD_BENFICIARIO}
    Wait Until Element Is Visible       ${CMP_CPF}                                    timeout=None
    Input Text                          ${NUM_CPF}                                    ${CPF_2}
    Double Click Element                ${LUPA_CPF}

    Page Should Contain                 Nome Completo                                 loglevel=TRACE
    Input Text                          ${CMP_TEL}                                    ${TELEFONE}
    Input Text                          ${CMP_EMAIL}                                  ${EMAIL}
    Input Text                          ${CMP_CEP}                                    ${CEP}
    Sleep                               1s
    Double Click Element                ${LUPA_CEP}
    Sleep                               1s
    Scroll Page To Location             0                                             2000
    Page Should Contain                 Endereço
    Input Text                          ${LOGR}                                       100
    Double Click Element                ${PARTES_SALVAR}

    Page Should Contain                 RALPH DA SILVA SOUZA                          loglevel=TRACE
    Page Should Contain                 LAURA MARIA FARIA ANTONIALI LEAL DE BRITTO    loglevel=TRACE

    Double Click Element                ${BTN_SAV_PARTES}

Quando insiro o Bem Dinheiro em Espécie - Moeda Nacional
    Wait Until Element Is Visible       ${CAD_BENS}                                   timeout=None             error=None
    Click Element                       ${CAD_BENS}                                   modifier=False

    Page Should Contain                 Bens e Direitos                               loglevel=TRACE

    Click Element                       ${TIPO_BEM}                                   modifier=False
    Wait Until Element Is Visible       ${$_MOEDANAC}                                 timeout=None             error=None
    Click Element                       ${$_MOEDANAC}                                 modifier=False

    Input Text                          ${OBS_MOEDA}                                  observação regressivo
    Input Text                          ${VLR_DECL}                                   500.000,00

    Click Element                       ${BTN_SAV_BENS}                               modifier=False

E partilho o valor do bem
    Page Should Contain                 Dinheiro Espécie Moeda Nacional               loglevel=TRACE
    Scroll Page To Location             0                                             2000
    Wait Until Element Is Visible       ${PERC_%}                                     timeout=None             error=None
    Press Keys                          ${PERC_%}                                     BACKSPACE
    Press Keys                          ${PERC_%}                                     100
    Press Keys                          ${PERC_%}                                     ENTER
    Double Click Element                ${BTN_SAV_PERC}
    Sleep                               3s

    Page Should Contain                 Demonstrativo de cálculo                      loglevel=TRACE

Então devo observar os valores informados e obter o nº da declaração
    Page Should Contain                 Fato Gerador - Doação Plena                   loglevel=TRACE
    Page Should Contain                 AÇÃO NECESSÁRIA:                              loglevel=TRACE

    Page Should Contain Element         ${FG_TRASMIT}
    Page Should Contain Element         ${FG_PERC}
    Scroll Page To Location             0                                             2000
    Page Should Contain Element         ${FG_TOTAL}


    Wait Until Element Contains         ${FG_CALC}                                    CALCULAR FATO GERADOR    timeout=None    error=None

    Double Click Element                ${FG_CALC}

    Wait Until Page Contains Element    ${FG_PAGAR}                                   timeout=None             error=None
    Double Click Element                ${FG_SALVAR}

    #TELA DE ANEXO - BEM SEM ANEXO
    Wait Until Page Contains Element    ${NO_ANEXO}                                   timeout=None             error=None
    Wait Until Element Is Visible       ${ANEXO_SAV}                                  timeout=None             error=None
    Double Click Element                ${ANEXO_SAV}

    #TELA DE ENVIO
    Page Should Contain                 ${TXT_ENVIO}                                  loglevel=TRACE
    Wait Until Element Is Visible       ${BTN_ENVIO}                                  timeout=None             error=None
    Double Click Element                ${BTN_ENVIO}
    Page Should Contain Element         ${ENV_SUCESSO}


    ${number}                           Get Text                                      ${NUM_DECL}
    Log                                 ${number}

    End Test