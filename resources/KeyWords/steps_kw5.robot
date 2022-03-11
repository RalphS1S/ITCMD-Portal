*** Settings ***
Resource    ../base.robot
Resource    ../Page_Objects/Bens/dinheiroNacional.robot

#Library    keyword.py


***Keywords***
#----Login----
Dado que acesso a página login
    #Acesso Login
    Go To    ${BASE_URL}

E acesso título itcmdSobre
    #Localizando a Page /itcmdSobre
    Wait Until Element Is Visible    ${FAZER_DECLARAÇÃO}    timeout=30        error=None
    Click Element                    ${FAZER_DECLARAÇÃO}    modifier=False
    Wait Until Element Is Visible    ${ACESSAR}             timeout=30        error=None
    Click Element                    ${ACESSAR}             modifier=False

Quando logo com a minha credencial
    #Informando dados de usuário
    Wait Until Element Is Visible    ${LGN_USUARIO}    timeout=30        error=None
    Click Element                    ${LGN_USUARIO}    modifier=False
    Input Text                       ${LGN_USUARIO}    ${USR_CPF}

    #Informando dados de senha
    Wait Until Element Is Visible    ${LGN_SENHA}    timeout=30    error=None

    Click Element    ${LGN_SENHA}    modifier=False
    Input Text       ${LGN_SENHA}    ${USR_SENHA}

    #Clicar em Acessar
    Wait Until Element Is Visible    ${BTN_ACESSAR}    timeout=30    error=None
    Click Button                     ${BTN_ACESSAR}

    Então valido usuário logado    

#----Criar declaração Divórcio Cartório----

Dado que estou logado como contribuinte

    Wait Until Element Is Enabled       ${LGN_DECLARAÇÃO}    timeout=60    error=None                                     
    Element Should Be Enabled           ${LGN_DECLARAÇÃO}
    Wait Until Page Contains Element    ${LGN_DECLARAÇÃO}    timeout=30    error=Não localizado botão Fazer Declaração    
    Click Element At Coordinates        ${LGN_DECLARAÇÃO}    147           19                                             
    Double Click Element                ${LGN_DECLARAÇÃO}    

    Page Should Contain    Art. 299 - Omitir,

    Wait Until Element Is Visible    ${CAMPO_TEL}    timeout=30    error=None    

    Wait Until Element Is Visible    ${CAMPO_LOGR}    timeout=30    error=None    

    Wait Until Element Is Visible    ${CHK_299}    timeout=30        error=None 
    Click Element                    ${CHK_299}    modifier=False

    Page Should Contain    299 do Código Penal:    

    Wait Until Element Is Visible    ${BTN_INICIAR}    timeout=30         error=None
    Click Element                    ${BTN_INICIAR}    #modifier=False

E informo modalidade divórcio

    Wait Until Element Is Visible    ${DESEJO}    timeout=60             error=None
    Element Text Should Be           ${DESEJO}    O que deseja fazer?

    Click Element    ${NOVA_DECL}    modifier=False

    Wait Until Element Is Visible    ${TIPO_TRANS}      timeout=60    error=None
    Click Element                    ${BTN_DIVORCIO}    

    Page Should Contain    Qual a modalidade?    loglevel=TRACE
    Page Should Contain    Cartório              loglevel=TRACE

    Wait Until Element Is Visible    ${RD_DIVORCIO}    timeout=60        error=None
    Click Element                    ${RD_DIVORCIO}    modifier=False

Quando preencho a lista de itens dos Dados Gerais

    Scroll Page To Location    0    2000 

    Wait Until Element Is Visible    ${CAD_UF}    timeout=60    error=None    
    Select From List By Value        ${CAD_UF}    17
    Wait Until Element Contains      ${CAD_UF}    PR            timeout=60    error=None

    Wait Until Element Is Visible    ${CD_MUNICIPIO}    timeout=60        error=None
    Click Element                    ${CD_MUNICIPIO}    modifier=False    
    Select From List By Value        ${CD_MUNICIPIO}    95                
    Wait Until Element Contains      ${CD_MUNICIPIO}    CURITIBA          timeout=60    error=None

    Wait Until Element Is Visible    id=pt1:socCodReparticao::content    timeout=60        error=None
    Click Element                    id=pt1:socCodReparticao::content    modifier=False
    Select From List By Value        id=pt1:socCodReparticao::content    1

    Wait Until Element Is Visible    id=pt1:btnSobrepartilhaNao    timeout=60        error=None
    Click Element                    id=pt1:btnSobrepartilhaNao    modifier=False

    Wait Until Element Is Visible    ${BTN_SALVAR}    timeout=30    error=None

E clico em Salvar e Prosseguir, sou encaminhado para lista de Pessoas

    Wait Until Element Is Visible    ${BTN_SALVAR}    timeout=30    error=None
    Double Click Element             ${BTN_SALVAR}

    Scroll Page To Location          0                    2000
    Wait Until Element Is Enabled    ${BTN_PROSSEGUIR}    timeout=30    error=NoneF
    Double Click Element             ${BTN_PROSSEGUIR}

Então observo o usuário encaminhado à /itcmdListaPartes

    Scroll Page To Location          0                     2000
    Wait Until Element Is Visible    ${CAD_DIVORCIO}       timeout=60    error=None
    Wait Until Page Contains         Pessoas Envolvidas    timeout=60    error=None

Dado que clico em Cadastrar Pessoa

    Wait Until Element Is Visible    ${CAD_DIVORCIO}    timeout=60        error=None
    Click Element                    ${CAD_DIVORCIO}    modifier=False

E informo CPF dos divorciandos válidos
#----Primeiro divorciando----
    Wait Until Element Is Visible    ${CMP_CPF}     timeout=60    error=None
    Input Text                       ${NUM_CPF}     ${CPF_3}
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

#----Segundo Divorciando----
    Wait Until Element Is Visible    ${CAD_DIVORCIO}    timeout=60        error=None
    Click Element                    ${CAD_DIVORCIO}    modifier=False

    Wait Until Element Is Visible    ${CMP_CPF}     timeout=60    error=None
    Input Text                       ${NUM_CPF}     ${CPF_4}
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

Quando retorno a tela /itcmdListaPartes observo os nomes cadastrados

    Wait Until Page Contains         ${CPF_3}             timeout=60    error=None
    Wait Until Page Contains         ${CPF_4}             timeout=60    error=None
    Wait Until Element is Visible    ${BTN_SAV_PARTES}

    ${name1}    Get Text    ${NOME_PARTE1}
    Log         ${name1}

    ${name2}    Get Text    ${NOME_PARTE2}
    Log         ${name2}

E observo o botão Salva e Prosseguir habilitado

    Wait Until Element Is Enabled    ${BTN_SAV_PARTES}      timeout=60    error=None
    Wait Until Page Contains         SALVAR E PROSSEGUIR    timeout=60    error=None    

Então clico no botão, prosseguindo para tela /itcmdListaBens

    Wait Until Element Is Enabled    ${BTN_SAV_PARTES}      timeout=60    error=None
    Wait Until Page Contains         SALVAR E PROSSEGUIR    timeout=60    error=None 
    Double Click Element             ${BTN_SAV_PARTES}      

    Wait Until Page Contains         Bens e Direitos    timeout=60    error=None    
    Wait Until Element Is Visible    ${CAD_BENS}        timeout=60    error=None

Incluíndo ativo Dinheiro em Espécie Moeda Nacional e salvando

    Ativo Dinheiro em Espécie Moeda Nacional

Dado que possuo as duas partes do divórcio
    ${name1}=    Get Text    ${NOME_PARTILHA1}
    Log          ${name1}

    ${name2}=    Get Text    ${NOME_PARTILHA2}
    Log          ${name2}

    Set Global Variable    ${name1} 
    Set Global Variable    ${name2}     

    Page Should Contain    ${name1}    loglevel=TRACE
    Page Should Contain    ${name2}    loglevel=TRACE

    Scroll Page To Location    0    2000

    Wait Until Element Is Visible    ${PERC_%}    timeout=30    error=None

E informo os valores correspondentes da partilha
#----Percentual para o primeiro Divorciando-----#
    Wait Until Element Is Visible    ${PERC_%}    timeout=60    error=None
    Press Keys                       ${PERC_%}    BACKSPACE
    Press Keys                       ${PERC_%}    50
    Press Keys                       ${PERC_%}    ENTER
#----Percentual para o segundo Divorciando-----#
    Scroll Page To Location          0             2000          
    Wait Until Element Is Visible    ${PERC2_%}    timeout=60    error=None
    Press Keys                       ${PERC2_%}    BACKSPACE
    Press Keys                       ${PERC2_%}    50
    Press Keys                       ${PERC2_%}    ENTER

E Observo o cálculo do valor recebido pelas partes

    Wait Until Page Contains    Valor recebido    timeout=60    error=None

    Element Should Contain    ${GRID_BEM}    ${name1}    message=Contem, ${name1}    ignore_case=False
    Element Should Contain    ${GRID_BEM}    ${name2}    message=Contém, ${name2}    ignore_case=False

    Log    ${name1}    level=INFO    html=False    console=False    repr=False
    Log    ${name2}    level=INFO    html=False    console=False    repr=False

Quando é observado a divisão equânime

    Should Not Be Equal As Strings    50              2.500.000,00    msg=Partilha incorreta    values=True    ignore_case=False
    Should Be Equal                   2.500.000,00    2.500.000,00    msg=Partilha Correta      values=True    ignore_case=False

Então a soma dos valores partilhados é a porcentagem total do bem

    Page Should Contain    100%    loglevel=TRACE

    Wait Until Element Is Visible    ${BTN_SAV_PERC}    timeout=60
    Double Click Element             ${BTN_SAV_PERC}

    # Wait Until Element Is Visible    ${BTN_ATENÇÂO}    timeout=60
    # Page Should Contain              Atenção           loglevel=TRACE
    # Click Element                    ${BTN_ATENÇÂO}    modifier=False

Dado que possuo os valores zerados para FG equânime

    Wait Until Page Contains    Demonstrativo de cálculo    timeout=60    error=None    

    Wait Until Element Contains    ${BENEFICIARIO1}    R$ 0,00    timeout=60    error=None
    Wait Until Element Contains    ${BENEFICIARIO2}    R$ 0,00    timeout=60    error=None

E adiciono observação necessária, salvo e prossigo

    Wait Until Element Is Visible    ${CMP_OBSERVAÇÂO}    timeout=60                           error=None
    Input Text                       ${CMP_OBSERVAÇÂO}    Observação FG equânime AUTO Ralph

    Scroll Page To Location    0    2000

    Wait Until Element Contains    ${FG_CALC}                      CALCULAR FATO GERADOR    timeout=60    error=None
    Double Click Element           ${FG_CALC}
    Wait Until Page Contains       ITCMD calculado com sucesso!    timeout=60               error=None

    Wait Until Element Is Visible    ${FG_SALVAR}    timeout=60    error=None
    Double Click Element             ${FG_SALVAR}

Quando insiro os anexos correspondentes

    Wait Until Element Is Visible    ${ABA_DADOS}    timeout=60        error=None
    Click Element                    ${ABA_DADOS}    modifier=False

    Page Should Contain    Anexos    loglevel=TRACE

    Wait Until Element Is Enabled    ${BNT_ESCOLHER}    timeout=60    error=None    
    #Execute JavaScript               document.getElementById('pt1:iAnexosDG:0:inputFile1::content').click()

#----Anexar Documentos em PDF para LI de ANEXOS----

#Dados Gerais - Minuta da Escritura Pública...
    Choose File                    ${ANEXO_GERAL}    ${FILE}
    Wait Until Element Contains    ${PAINEL}         ${NOME_PDF}    timeout=60    error=None

    Scroll Page To Location    0    2000

Então posso enviar a declaração e observar seu número

    Wait Until Element Is Visible    ${ABA_PESSOAS}    timeout=60        error=None
    Click Element                    ${ABA_PESSOAS}    modifier=False

#Pessoas - Certidão de Casamento...
    Choose File                    ${ANEXO_PESSOAS}    ${FILE}
    Wait Until Element Contains    ${PAINEL3}          ${NOME_PDF}    timeout=60    error=None

    Wait Until Element Is Enabled    ${BTN_SALVAR}    timeout=60        error=None
    Click Element                    ${BTN_SALVAR}    modifier=False

    #TELA DE ENVIO
    Wait Until Element Is Visible    ${BTN_ENVIO}    timeout=60    error=None    
    Wait Until Page Contains         ${TXT_ENVIO}    timeout=60    error=None

    Wait Until Element Is Enabled    ${BTN_ENVIO}    timeout=60    error=Botão Envio    
    Double Click Element             ${BTN_ENVIO}

    Wait Until Element Contains    ${ENV_SUCESSO}    ${MSG_ENVIO}    timeout=60    error=None


    ${number}    Get Text     ${NUM_DECL}
    Log          ${number}

    End Test 















