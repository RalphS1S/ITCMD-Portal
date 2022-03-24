*** Settings ***

#Library    keyword.py

***Keywords***
Anexo Documento Comprobatório da Compra e Venda
    #----Anexar Documentos em PDF para LI de ANEXOS----
    Wait Until Element Is Visible    ${ABA_DADOS}    timeout=60        error=None
    Click Element                    ${ABA_DADOS}    modifier=False

    Page Should Contain    Documento Comprobatório da Compra e Venda    loglevel=TRACE

    Wait Until Element Is Enabled    ${BNT_ESCOLHER}    timeout=60    error=None    

#Dados Gerais - Documento Comprobatório da Compra e Venda...
    Page Should Contain            Documento Comprobatório da Compra e Venda    loglevel=TRACE
    Choose File                    ${ANEXO_GERAL}                               ${FILE}
    Wait Until Element Contains    ${PAINEL}                                    ${NOME_PDF}       timeout=60    error=None

    Scroll Page To Location    0    2000