***Settings***
Documentation    Criar declaração
...              Para que consiga cadastrar uma declaração
...              Sendo um usuário logado
...              Quero concluir o envio de um divórcio judicial equânime

Resource    ../../resources/KeyWords/steps_kw3.robot

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador


***Test Cases****
Quero logar para criar um divórcio equânime
    Estou Logado
    #Go To       ${URL_AREA}

Enviar declaração divórcio
    Dado que inicio uma declaração de divórcio judicial
    E tenho um divorciado e divorciando válidos 
    Quando insiro o Bem Dinheiro em Espécie - Moeda Nacional
    E partilho o valor do bem
    Então devo observar um FG equânime e obter o nº da declaração