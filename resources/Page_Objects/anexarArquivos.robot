*** Settings ***

#Library    keyword.py

***Keywords***
E devo anexar os documentos necessarios

    #Wait Until Page Contains Element    ${ABA_DADOSGERAIS}                           timeout=None

    #Scroll Page To Location             0                                             2000
    Click Element                       ${BNT_ESCOLHER}
    Input Text                          C:\Users\mauri.zellner\Documents\teste.pdf     