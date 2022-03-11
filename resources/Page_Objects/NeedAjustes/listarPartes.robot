*** Settings ***

#Library    keyword.py

***Keywords***
Cadastro transmitente, meeira e herdeiros
    #Cadastrando Transmitente
    Sleep                               1
    Scroll Page To Location             0                                             2000
    Page Should Contain                 Pessoas Envolvidas                            loglevel=TRACE
    Click Element                       ${BTN_CADASTRARFALECIDO}

    Wait Until Element Is Visible       ${CMP_CPF}                                    timeout=None             error=None
    Input Text                          ${NUM_CPF}                                    ${CPF_TRANSMITENTE}
    Click Element                       ${LUPA_CPF}

    Input Text                          ${DATA_FALECIMENTO}                            20/08/2020

    Scroll Page To Location             0                                             2000
    Click Element                       ${ELEMENTO_DECENTENTES} 
    Page Should Contain                 Esta pessoa tinha descendentes vivos na data do óbito do autor da herança?
    Sleep                               1
    Select Radio Button                 ${RADIO_DESCENTENTESSIM}                       1
    

    Select From List By Value           ${ESTADO_CIVIL}                                1
    Sleep                               1
    Input Text                          ${DATA_CASAMENTO}                              02/02/2000
    Select From List By Value           ${COMBO_REGIMEBENS}                            0


    Input Text                          ${CMP_CEP}                                    ${CEP_CM}
    Sleep                               1s
    Click Element                       ${LUPA_CEP}
    Scroll Page To Location             0                                             2000
    Page Should Contain                 Endereço
    Input Text                          ${LOGR}                                       100
    
    Double Click Element                ${PARTES_SALVAR}
    Sleep                               2
    #Cadastradno meeira
    Scroll Page To Location             0                                             2000
    Click Element                       ${BTN_CADASTRARMEEIRO}
    Wait Until Element Is Visible       ${CMP_CPF}                                    timeout=None             error=None
    Input Text                          ${NUM_CPF}                                    ${CPF_MEEIRO}
    Click Element                       ${LUPA_CPF}

    Page Should Contain                 Nome Completo                                 loglevel=TRACE
    Input Text                          ${CMP_TEL}                                    ${TELEFONE_CM}
    Input Text                          ${CMP_EMAIL}                                  ${EMAIL_CM}
    Input Text                          ${CMP_CEP}                                    ${CEP_CM}
    Sleep                               1s
    Click Element                       ${LUPA_CEP}
    Scroll Page To Location             0                                             2000
    Page Should Contain                 Endereço
    Input Text                          ${LOGR}                                       100
    
    Double Click Element                ${PARTES_SALVAR}
    Sleep                               2
    #Cadastradno PRIMEIRO HERDEIRO
    Scroll Page To Location             0                                             2000
    Wait Until Element Is Visible       ${BTN_CADASTRARHERDEIRO}                                   
    Click Element                       ${BTN_CADASTRARHERDEIRO}
    Wait Until Element Is Visible       ${CMP_CPF}                                    timeout=None             error=None
    Input Text                          ${NUM_CPF}                                    ${CPF_HERDEIRO1}
    Click Element                       ${LUPA_CPF}

    Page Should Contain                 Nome Completo                                 loglevel=TRACE
    Input Text                          ${CMP_TEL}                                    ${TELEFONE_CM}
    Input Text                          ${CMP_EMAIL}                                  ${EMAIL_CM}
    Input Text                          ${CMP_CEP}                                    ${CEP_CM}
    Sleep                               1s
    Click Element                       ${LUPA_CEP}
    Scroll Page To Location             0                                             2000
    Page Should Contain                 Endereço
    Input Text                          ${LOGR}                                       100
        
    Double Click Element                ${PARTES_SALVAR}
 
    Sleep                               2

    Click Element                       ${BTN_SAVAR_PROSSEGUIR}
    