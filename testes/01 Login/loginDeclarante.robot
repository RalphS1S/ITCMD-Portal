***Settings***
Documentation    Login
...              Para que eu possa ter acesso a interface ITCMD
...              Sendo um usuário que possui um login
...              Quero iniciar uma nova sessão

Resource    ../../resources/KeyWords/steps_kw.robot

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador


***Test Cases***
Quero logar como usuário válido
    Dado que acesso a página login
    E acesso título itcmdSobre
    Quando logo com a minha credencial
    Então valido usuário logado


