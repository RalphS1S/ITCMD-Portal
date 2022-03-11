*** Settings ***

#Library    keyword.py

***Keywords***
Realizo o partilha equanime dos bens cadastrado
    Page Should Contain                 Dinheiro Espécie Moeda Nacional               loglevel=TRACE
    Scroll Page To Location             0                                             2000
    Wait Until Element Is Visible       ${PERC_MEEIRO%}                               timeout=None             error=None
    Press Keys                          ${PERC_MEEIRO%}                               BACKSPACE
    Press Keys                          ${PERC_MEEIRO%}                               50
    Press Keys                          ${PERC_MEEIRO%}                               ENTER

    Press Keys                          ${PERC_HERDEIRO1%}                            BACKSPACE
    Press Keys                          ${PERC_HERDEIRO1%}                            50
    Press Keys                          ${PERC_HERDEIRO1%}                            ENTER
    Sleep                               2
    
    Wait Until Element Is Visible       ${BTN_SAVAR_PROSSEGUIR}                               timeout=None
    Click Element                       ${BTN_SAVAR_PROSSEGUIR}                               
    Wait Until Element Is Visible       ${BTN_DESPESANAO}
    Click Element                       ${BTN_DESPESANAO} 
    Sleep                               4