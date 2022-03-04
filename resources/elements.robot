Documentation    Representação do padrão Page Object para Robot Framework

***Variables****
#Tela Minha Área
${URL_BASE}
#${URL_AREA}    http://webcnp01.homologacao.sefa.parana:8893/portalsgt_SIT/faces/minhaArea

#Login Page /itcmdSobre
${FAZER_DECLARAÇÃO}    id=pt1:b4a
${LGN_DECLARAÇÃO}      id=pt1:b4
${ACESSAR}             id=pt1:popup:b1

#Autenticador
${LGN_USUARIO}        id=attribute
${USR_CPF}            53598830904 
${LGN_SENHA}          id=password
${USR_SENHA}          sefa2021
${full_name_login}    SERGIO ZAPE

#Botão Acesso
${BTN_ACESSAR}    xpath=//input[@value='Acessar']

#Tela Declarante
${CAMPO_TEL}      id=pt1:it4::content
${TELEFONE}       (41) 3023-3312
${CHK_299}        xpath= //input[@id='pt1:sbcUsuConcordaTermos::content']
${CAMPO_LOGR}     id=pt1:itxComplLogradouro::content
${BTN_INICIAR}    xpath=//div[@id='pt1:btnIniciarDeclaracao']/a/span

#Dados Gerais
${DESEJO}       xpath=//span[contains(text(), 'O que deseja fazer?')]
${NOVA_DECL}    id=pt1:btnComplementarNao

#Dados Tipo Tranmissão Doação Ato Particular
${TIPO_TRANS}         xpath=//span[contains(text(),"Selecione o tipo de transmissão:")]
${BTN_DOACAO}         id=pt1:btnTransmDoacao
${ATO_PARTICULAR}     xpath=//label[contains(text(),"Por Ato Particular")]
${RADIO_DOACAO}       pt1:sorTipoRegistro
${DTA_DOACAO}         xpath=//span[contains(text(),"Data da Doação")]
${DTA_MODALIDADE}     id=pt1:itxDtAcaoModalidade::content
${PROSS_DOACAO}       xpath=//*[@id='pt1:b3']
${DOACAO_PLENA}       pt1:sorTipoDoacao
${BTN_SALVAR}         xpath=//span[contains(text(), 'SALVAR E PROSSEGUIR')]
${BTN_PROSSEGUIR}     xpath=/html/body/div[1]/form/span[1]/div[2]/div[5]/div/div/div/span/div/div[3]/div
${CAD_BENFICIARIO}    xpath=/html/body/div/form/span[1]/div[2]/div[4]/div/div/div/div[3]/div[4]/table/tbody/tr/td[3]/div/div/div/a
${BTN_SAV_PARTES}     xpath=/html/body/div/form/span[1]/div[2]/div[5]/div/div/span/div/div[3]/div/a

#Dados Tipo Transmissão Doação Escritura Pública
${TIPO_TRANS}        xpath=//span[contains(text(),"Selecione o tipo de transmissão:")]
${BTN_DOACAO}        id=pt1:btnTransmDoacao
${ESCR_PUBLICA}      xpath=////label[contains(text(),"Por Escritura Pública")]
${CD_CARTORIO}       xpath=//select[@title='Selecione']
${COMBO_CARTORIO}    xpath=//select[@title='JUNTA COMERCIAL DO PARANA']

#Dados Tipo Transmissão Divórcio Judicial
${BTN_DIVORCIO}      id=pt1:btnTransmDivorcio
${RD_DIVJUDICIAL}    id=pt1:sorTipoInventario:_1
${DT_SENTENÇA}       id=pt1:itxDtAcaoModalidade::content
${BTN_SETA}          xpath=////a[@onclick='this.focus();return false'] 
${BTN_PROJUDN}       id=pt1:btnPROJUDINao
${NUM_AUTOS}         id=pt1:itxNumAutos::content
${BTN_SETA1}         id=pt1:btnOkNumAuto::icon
${CAD_UF}            id=pt1:socSiglaUF::content
${CD_MUNICIPIO}      id=pt1:socCodigoMunicipio::content
${JUIZO_DIV}         id=pt1:itxNomeReparticao::content
${BTN_SETA2}         id=pt1:b4
${SOBREPART_N}       id=pt1:btnSobrepartilhaNao
${ALVARA_N}          id=pt1:btnLiberacaoBensAlvaraNao


#Dados Tipo Transmissão Divórcio Cartório
${BTN_DIVORCIO}    id=pt1:btnTransmDivorcio
${RD_DIVORCIO}     id=pt1:sorTipoInventario:_0




#PARTES
${CAD_DIVORCIO}     id=pt1:btnCadastrarDivorciando
${CPF_1}            053.285.259-14
${CPF_2}            110.020.488-18
${EMAIL}            ralph.souza@integraparana.com.br
${CEP}              80240018
${CAD_TRANSMIT}     id=pt1:btnCadastrarTransmitente
${CMP_CPF}          xpath=//label[contains(text(),"CPF/CNPJ")]
${NUM_CPF}          id=pt1:itxNumCpfCnpj::content
${LUPA_CPF}         xpath=//*[@id="pt1:btnCpfCnpj"]/a
${CMP_TEL}          id=pt1:itxNumTelefone::content
${CMP_EMAIL}        id=pt1:itxEmail::content
${CMP_CEP}          id=pt1:itxCEP::content
${LUPA_CEP}         xpath=//*[@id="pt1:btnCEP"]/a
${LOGR}             id=pt1:itxNrLogradouro::content
${PARTES_SALVAR}    xpath=//*[@id="pt1:btnSalvar"]/a

#BENS
${TITULO}          id=pt1:pgl7
${CAD_BENS}        xpath=//*[@id="pt1:b36"]/a
${TIPO_BEM}        xpath=//*[@id="pt1:comboTipoBem::content"]
${$_MOEDANAC}      xpath=//option[contains(text(), 'Dinheiro em Espécie - Moeda Nacional')]
${OBS_MOEDA}       id=pt1:formDinheiroEspecieMoedaNacional:itObsDinheiroEspecieMoedaNacional::content
${VLR_DECL}        id=pt1:formDinheiroEspecieMoedaNacional:itDinheiroEspecieMoedaNacionalValorDeclarado::content
${BTN_SAV_BENS}    xpath=//*[@id="pt1:b4"]/a

#PARTILHA
${PERC%}           xpath=//*[@id="pt1:j_id__ctru33:0:j_id__ctru76:0:itPerc__::content"]
${PERC_%}          xpath=/html/body/div/form/span[1]/div[2]/div[4]/div/div/div/div[3]/div[2]/span/div[2]/div[2]/div/div[4]/table/tbody/tr/td[2]/span/table/tbody/tr/td[2]/span/input
${PERC2_%}         xpath=//input[@id='pt1:j_id__ctru33:0:j_id__ctru76:1:itPerc__::content']
${BTN_SAV_PERC}    xpath=//*[@id="pt1:btnSalvarProsseguir"]/a
${full_name}       GABRIELLE MAIOLI
#---Popup Partilha Divórcio---
${BTN_ATENÇÂO}    id=pt1:j_id__ctru178

#CÁLCULO FG
${FG_TRASMIT}    xpath=//span[contains(text(), 'RALPH DA SILVA SOUZA')]
${FG_PERC}       xpath=//span[contains(text(), '100,00')]
${FG_TOTAL}      xpath=//span[contains(text(), 'R$ 500.000,00')]
${FG_CALC}       id=pt1:it1:0:bb1
${FG_PAGAR}      xpath=//*[@id="pt1:it1:0:i1:0:ot9"]
${FG_SALVAR}     xpath=//*[@id="pt1:btnSalvarProsseguir"]/a
#---FG Partilha Divórcio---
${EQUANIME}    xpath=//span[contains(text(), 'Fato Gerador - Divórcio com Partilha Equânime dos Bens')]
${FG_PERC1}    xpath=//span[contains(text(), '0,00')]



#ANEXO
${NO_ANEXO}     xpath=//span[contains(text(), "Nessa declaração, os documentos 'Dados Gerais' são opcionais, caso desejar, anexe-os na aba 'Outros'.")]
${ANEXO_SAV}    id=pt1:btnSalvarProsseguir
${FILE}         C:\\Users\\SOLUTTIONS\\JonhPDF.pdf
${NOME_PDF}     JonhPDF.pdf
#----Anexos para Doação Escritura Pública----
${ANEXO_GERAL3}    xpath=//input[@id='pt1:iAnexosDG:0:inputFile1::content']
${PAINEL4}         id=pt1:iAnexosDG:0:panelDG


#----Anexos para Divórcio----
${ABA_DADOS}       id=pt1:tabDG::disAcr                               
${BNT_ESCOLHER}    xpath=//label[@class='af_inputFile_label-text']

#----Anexo DADOS GERAIS----
${ANEXO_GERAL}    xpath=//input[@type='file']
${PAINEL}         id=pt1:iAnexosDG:0:i21:0:ot4::text 
#---
${ANEXO_GERAL1}    xpath=//input[@id='pt1:iAnexosDG:1:inputFile1::content']
${PAINEL1}         id=pt1:iAnexosDG:1:panelDG 
#---
${ANEXO_GERAL2}    xpath=//input[@id='pt1:iAnexosDG:2:inputFile1::content']
${PAINEL2}         id=pt1:iAnexosDG:2:panelDG 
#----Anexo PESSOAS---
${ABA_PESSOAS}      id=pt1:tabP::disAcr
${ANEXO_PESSOAS}    xpath=//input[@id='pt1:is3:1:iAnexosP:0:if1::content']
${PAINEL3}          id=pt1:is3:1:iAnexosP:0:pgl5




#ENVIO/PDF
${TXT_ENVIO}    Confira os dados abaixo antes de enviar a declaração:
${BTN_ENVIO}    xpath=//*[@id="pt1:j_id__ctru13"]/a

#TELA CONFIRMAÇÃO ENVIO
${ENV_SUCESSO}    xpath=//span[contains(text(), 'Declaração finalizada e Enviada com sucesso!')]
${NUM_DECL}       xpath=//*[@class='x24y']