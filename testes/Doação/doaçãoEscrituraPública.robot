***Settings***
Documentation    Criar declaração
...              Para que consiga cadastrar uma declaração
...              Sendo um usuário logado
...              Quero concluir o envio de uma doação plena por escritura pública

Resource    ../../resources/KeyWords/steps_kw2.robot

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador


***Test Cases****
Quero logar para criar uma doação plena
    Estou Logado
    #Go To       ${URL_AREA}


Enviar declaração doação
    Dado que envio uma declaração de doação por escritura pública
    E tenho um doador e donatário válidos para escritura 
    Quando insiro o Bem Dinheiro em Espécie - Moeda Nacional
    E partilho o valor do bem
    Então devo observar os valores informados obtendo o nº da declaração da escritura