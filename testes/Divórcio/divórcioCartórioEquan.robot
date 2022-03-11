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

Adicionar ativo para divórcio cartório
    Incluíndo ativo Dinheiro em Espécie Moeda Nacional e salvando

Partilhar Bem Fato Gerador Equânime
    Dado que possuo as duas partes do divórcio
    E informo os valores correspondentes da partilha
    E Observo o cálculo do valor recebido pelas partes
    Quando é observado a divisão equânime
    Então a soma dos valores partilhados é a porcentagem total do bem

Validar valores e enviar declaração
    Dado que possuo os valores zerados para FG equânime
    E adiciono observação necessária, salvo e prossigo
    Quando insiro os anexos correspondentes   
    Então posso enviar a declaração e observar seu número






     


