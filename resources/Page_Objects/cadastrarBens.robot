*** Settings ***

#Library    keyword.py

***Keywords***
Quando informo os bens de direito
    Wait Until Element Is Visible       ${CAD_BENS}                                   timeout=None             error=None
    Click Element                       ${CAD_BENS}                                   modifier=False

    Page Should Contain                 Bens e Direitos                               loglevel=TRACE

    Select From List By Value           ${COMBO_TIPODOBENS}                           8
    Double Click Element                ${RADIO_BEMCOMPAR}                            
    #Select Radio Button                 ${RADIO_BEMCOMPAR}                            0
    Input Text                          ${OBS_MOEDA}                                  observação regressivo
    Input Text                          ${VLR_DECL}                                   800.000,00
    Sleep                               2
    Click Element                       ${BTN_SAV_BENS}                               modifier=False
