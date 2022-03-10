***Settings***
Documentation    Criar declaração
...              Para que consiga cadastrar uma declaração
...              Sendo um usuário logado
...              Quero concluir o envio de uma doação plena

Resource    ../../resources/KeyWords/steps_kw.robot

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador


***Test Cases****
Quero logar para criar uma doação plena
    Estou Logado
    #Go To       ${URL_AREA}

Enviar declaração doação
    Dado que inicio uma declaração de doação ato particular
    E tenho um doador e donatário válidos 
    Quando insiro o Bem Dinheiro em Espécie - Moeda Nacional
    E partilho o valor do bem
    Então devo observar os valores informados e obter o nº da declaração

