*** Settings ***

#Library    keyword.py

***Keywords***
Anexo Ativo Casa

    Wait Until Element Is Visible    ${ABA_BENS}    timeout=60        error=None
    Click Element                    ${ABA_BENS}    modifier=False

#Bens e Direitos...
    #Matrícula Atualizada do Imóvel
    Choose File                    ${ANEXO_BENS}    ${FILE}
    Wait Until Element Contains    ${PAINEL6}       ${NOME_PDF}    timeout=60    error=None

    #IPTU Atual do Imóvel Urbano
    Choose File                    ${ANEXO_BENS2}    ${FILE}
    Wait Until Element Contains    ${PAINEL_BENS}    ${NOME_PDF}    timeout=60    error=None


    Wait Until Element Is Enabled    ${BTN_SALVAR}    timeout=60        error=None
    Click Element                    ${BTN_SALVAR}    modifier=False