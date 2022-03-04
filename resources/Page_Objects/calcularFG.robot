*** Settings ***

#Library    keyword.py

***Keywords***
Entao devo realizar o calculos do imposto devido

    Page Should Contain                 Fato Gerador - Causa Mortis                   loglevel=TRACE
    Page Should Contain                 AÇÃO NECESSÁRIA:                              loglevel=TRACE

    Page Should Contain Element         ${FG_TRASMIT}
    Page Should Contain Element         ${FG_PERC}
    Scroll Page To Location             0                                             2000
   # Page Should Contain Element         ${FG_TOTAL}


    Wait Until Element Contains         ${FG_CALC}                                    CALCULAR FATO GERADOR    timeout=None    error=None

    Double Click Element                ${FG_CALC}

    Wait Until Page Contains Element    ${FG_PAGAR}                                   timeout=None             error=None
    Double Click Element                ${FG_SALVAR}
