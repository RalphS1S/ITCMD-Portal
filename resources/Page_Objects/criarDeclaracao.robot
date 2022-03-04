*** Settings ***


#Library    keyword.py

***Keywords***
Dado que crio uma declaração tipo Arrolamento Judicial
    Sleep                               25
    #Wait Until Element Is Visible       xpath=//div[@id='pt1:b4']/a/span
    Click Element                       ${LGN_DECLARAÇÃO}                             modifier=False

    Page Should Contain                 299 do Código Penal:

    #Click Element                       ${CAMPO_TEL}                                  modifier=False
    #Input Text                          ${CAMPO_TEL}                                  ${TELEFONE}

    #Click Element                       ${CAMPO_LOGR}                                 modifier=False
    #Input Text                          ${CAMPO_LOGR}                                 teste qualquer

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


    Element Text Should Be              ${DESEJO}                                     O que deseja fazer?

    Click Element                       ${NOVA_DECL}                                  modifier=False

    Wait Until Element Is Visible       ${TIPO_TRANS}                                 timeout=None 

    Click Element                       ${BTN_CAUSA_MORTIS}  

    Page Should Contain                 Qual a modalidade?                            loglevel=TRACE
    Page Should Contain                 Inventário                                    loglevel=TRACE]

    Scroll Page To Location             0                                             2000
    Select Radio Button                 ${RADIO_ARROLAMENTO}                          1

    Wait Until Element is Visible       ${BTN_TEMSENTENCA_SIM}
    Click Element                       ${BTN_TEMSENTENCA_SIM}                        

    Wait Until Element Is Visible       ${TXT_DT_SENTENCA}
    Input Text                          ${TXT_DT_SENTENCA}                              29/09/2020
    Click Element                       ${BTN_SENTACA}
    
    Wait Until Element Is Visible       ${BTN_TESTVINTARIONAO}
    Click Element                       ${BTN_TESTVINTARIONAO}

    Wait Until Element Is Visible       ${BTN_PREJUDINAO}
    Click Element                       ${BTN_PREJUDINAO}

    Wait Until Element Is Visible       ${TXT_NRO_AUTOS}
    Input Text                          ${TXT_NRO_AUTOS}                                9999999999
    Click Element                       ${BTN_OK_NRO_AUTOS}

    Wait Until Element Is Visible       ${LIST_UF}
    Select From List By Value           ${LIST_UF}                                      17
    Sleep                               2s
    #Wait Until Element Is Visible       ${LIST_MUNICIPIO}                               10
    Select From List By Value           ${LIST_MUNICIPIO}                               17
   
    Wait Until Element Is Visible       ${TXT_JUIZO}                                     timeout=None             error=None
    Press Keys                          ${TXT_JUIZO}                                     BACKSPACE
    Press Keys                          ${TXT_JUIZO}                                     JUIZADO
    Press Keys                          ${TXT_JUIZO}                                     ENTER 
    Sleep                               1                        
    Click Element                       ${BTN_JUIZO}

    Wait Until Element Is Visible       ${BTN_SOBREPARTILHANAO}                         5
    Click Element                       ${BTN_SOBREPARTILHANAO}

    Wait Until Element Is Visible       ${BTN_ALVARANAO}
    Click Element                       ${BTN_ALVARANAO}


    Sleep                               1s
    Scroll Page To Location             0                                             2000
    Click Element                       ${BTN_PROSSEGUIR}