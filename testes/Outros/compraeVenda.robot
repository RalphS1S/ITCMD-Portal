***Settings***
Documentation    Criar declaração
...              Para que consiga cadastrar uma declaração
...              Sendo um usuário logado
...              Quero concluir o envio de uma doação plena

Resource    ../../resources/KeyWords/steps_kw.robot

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador


***Test Cases****
Quero logar para criar uma compra e venda
    Estou Logado
    #Go To       ${URL_AREA}

Enviar declaração compra e venda
    Dado que inicio uma declaração de compra e venda
    E tenho um transmitente e beneficiário válidos
    Quando insiro o Bem Casa
    E partilho o valor do bem para único beneficiário
    E insiro os respectivos anexos de compra e venda
    E insiro os respectivos anexos do ativo casa
    Então devo observar PDF gerado e nº da declaração

    