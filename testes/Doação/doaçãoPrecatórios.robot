***Settings***
Documentation    Criar declaração
...              Para que consiga cadastrar uma declaração
...              Sendo um usuário logado
...              E possuíndo o ativo "Precatórios"
...              Quero concluir o envio observando a declaração em malha    

Resource    ../../resources/KeyWords/steps_kw4.robot

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador


***Test Cases****
Quero logar com usuário contribuinte

    Estou Logado
    #Go To       ${URL_AREA}

Enviar declaração divórcio
    Dado que inicio uma declaração de doação precatório
    E tenho doador e donatário válidos para malha 
    Quando insiro o Bem Precatórios
    E partilho o valor do bem
    E obtenho os valores calculados do fato gerador
    E anexo os arquivos correspondentes
    Então devo obter os valores junto ao número da declaração e informação da malha