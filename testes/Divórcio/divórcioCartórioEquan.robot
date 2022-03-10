***Settings***
Documentation    Criar declaração
...              Para que consiga cadastrar uma declaração
...              Sendo um usuário logado
...              Quero concluir o envio de um divórcio cartório equânime

Resource    ../../resources/KeyWords/steps_kw5.robot

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador


***Test Cases****
Quero logar para criar um divórcio equânime
    Estou Logado
    #Go To       ${URL_AREA}

Criar declaração divórcio cartório
    Dado que estou logado como contribuinte
    E informo modalidade divórcio
    Quando preencho a lista de itens dos Dados Gerais
    E clico em Salvar e Prosseguir, sou encaminhado para lista de Pessoas
    Então observo o usuário encaminhado à /itcmdListaPartes

Cadastrar lista de pessoas para partilha
    Dado que clico em Cadastrar Pessoa
    E informo CPF dos divorciandos válidos
    Quando retorno a tela /itcmdListaPartes observo os nomes cadastrados
    E observo o botão Salva e Prosseguir habilitado
    Então clico no botão, prosseguindo para tela /itcmdListaBens