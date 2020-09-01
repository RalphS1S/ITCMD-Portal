Documentation          Representação do padrõ Page Object para Robot Framework

***Variables****
#Tela Minha Área
${URL_BAS}
#${URL_AREA}            http://webcnp01.homologacao.sefa.parana:8893/portalsgt_SIT/faces/minhaArea

#Login Page /itcmdSobre
${FAZER_DECLARAÇÃO}    id=pt1:b4a
${LGN_DECLARAÇÃO}      xpath=//*[@class="x27f xkq p_AFTextOnly"]
${ACESSAR}             pt1:popup:b1

#Autenticador
${LGN_USUARIO}         id=attribute
${USR_CPF}             38399276847
${LGN_SENHA}           id=password
${USR_SENHA}           sefa2020

#Botão Acesso
${BTN_ACESSAR}         xpath=//input[@value='Acessar']

#Tela Declarante
${CAMPO_TEL}           id=pt1:it4::content
${TELEFONE}            (41) 3023-3312
${CHK_299}             xpath= //input[@id='pt1:sbcUsuConcordaTermos::content']
${CAMPO_LOGR}          id=pt1:itxComplLogradouro::content
${BTN_INICIAR}         xpath=//div[@id='pt1:btnIniciarDeclaracao']/a/span

#Dados Gerais
${DESEJO}              xpath=//span[contains(text(), 'O que deseja fazer?')]
${NOVA_DECL}           id=pt1:btnComplementarNao
${TIPO_TRANS}          xpath=//span[contains(text(),"Selecione o tipo de transmissão:")]
${BTN_DOACAO}          id=pt1:btnTransmDoacao
${ATO_PARTICULAR}      xpath=//label[contains(text(),"Por Ato Particular")]
${RADIO_DOACAO}        pt1:sorTipoRegistro
${DTA_DOACAO}          xpath=//span[contains(text(),"Data da Doação")]
${DTA_MODALIDADE}      id=pt1:itxDtAcaoModalidade::content
${PROSS_DOACAO}        xpath=//*[@id='pt1:b3']
${DOACAO_PLENA}        pt1:sorTipoDoacao
${BTN_SALVAR}          id=pt1:btnSalvarProsseguir
${BTN_PROSSEGUIR}      xpath=/html/body/div[1]/form/span[1]/div[2]/div[5]/div/div/div/span/div/div[3]/div
${CAD_BENFICIARIO}     xpath=/html/body/div/form/span[1]/div[2]/div[4]/div/div/div/div[3]/div[4]/table/tbody/tr/td[3]/div/div/div/a
${BTN_SAV_PARTES}      xpath=/html/body/div/form/span[1]/div[2]/div[5]/div/div/span/div/div[3]/div/a

#PARTES
${CPF_1}               053.285.259-14
${CPF_2}               110.020.488-18
${EMAIL}               ralph.souza@integraparana.com.br
${CEP}                 80240018
${CAD_TRANSMIT}        id=pt1:btnCadastrarTransmitente
${CMP_CPF}             xpath=//label[contains(text(),"CPF/CNPJ")]
${NUM_CPF}             id=pt1:itxNumCpfCnpj::content
${LUPA_CPF}            xpath=//*[@id="pt1:btnCpfCnpj"]/a
${CMP_TEL}             id=pt1:itxNumTelefone::content
${CMP_EMAIL}           id=pt1:itxEmail::content
${CMP_CEP}             id=pt1:itxCEP::content
${LUPA_CEP}            xpath=//*[@id="pt1:btnCEP"]/a
${LOGR}                id=pt1:itxNrLogradouro::content
${PARTES_SALVAR}       xpath=//*[@id="pt1:btnSalvar"]/a

#BENS
${CAD_BENS}            xpath=//*[@id="pt1:b36"]/a
${TIPO_BEM}            xpath=//*[@id="pt1:comboTipoBem::content"]
${$_MOEDANAC}          xpath=//option[contains(text(), 'Dinheiro em Espécie - Moeda Nacional')]
${OBS_MOEDA}           id=pt1:formDinheiroEspecieMoedaNacional:itObsDinheiroEspecieMoedaNacional::content
${VLR_DECL}            id=pt1:formDinheiroEspecieMoedaNacional:itDinheiroEspecieMoedaNacionalValorDeclarado::content
${BTN_SAV_BENS}        xpath=//*[@id="pt1:b4"]/a

#PARTILHA
${PERC%}               xpath=//*[@id="pt1:j_id__ctru33:0:j_id__ctru76:0:itPerc__::content"]
${PERC_%}              xpath=/html/body/div/form/span[1]/div[2]/div[4]/div/div/div/div[3]/div[2]/span/div[2]/div[2]/div/div[4]/table/tbody/tr/td[2]/span/table/tbody/tr/td[2]/span/input
${BTN_SAV_PERC}        xpath=//*[@id="pt1:btnSalvarProsseguir"]/a
${full_name}           GABRIELLE MAIOLI

#CÁLCULO FG
${FG_TRASMIT}          xpath=//span[contains(text(), 'RALPH DA SILVA SOUZA')]
${FG_PERC}             xpath=//span[contains(text(), '100,00')]
${FG_TOTAL}            xpath=//span[contains(text(), 'R$ 500.000,00')]
${FG_CALC}             id=pt1:it1:0:bb1
${FG_PAGAR}            xpath=//*[@id="pt1:it1:0:i1:0:ot9"]
${FG_SALVAR}           xpath=//*[@id="pt1:btnSalvarProsseguir"]/a

#ANEXO
${NO_ANEXO}            xpath=//span[contains(text(), "Nessa declaração, os documentos 'Dados Gerais' são opcionais, caso desejar, anexe-os na aba 'Outros'.")]
${ANEXO_SAV}           id=pt1:btnSalvarProsseguir

#ENVIO/PDF
${TXT_ENVIO}           Confira os dados abaixo antes de enviar a declaração:
${BTN_ENVIO}           xpath=//*[@id="pt1:j_id__ctru13"]/a

#TELA CONFIRMAÇÃO ENVIO
${ENV_SUCESSO}         xpath=//span[contains(text(), 'Declaração finalizada e Enviada com sucesso!')]
${NUM_DECL}            id=pt1:otcNComp