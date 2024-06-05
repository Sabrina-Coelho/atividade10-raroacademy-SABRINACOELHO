*** Settings ***
Resource    ../base.robot
Resource    ../pages/gestaoInformacaoPage.robot
Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***
Deve acessar o inventário de estoque
    Dado que o usuário abriu o aplicativo
    Quando acessa o Menu
    Então tem acesso ao inventário de estoque

Deve acessar o relatório de saída de estoque
    Dado que o usuário abriu o aplicativo
    Quando acessa o Menu
    Então tem acesso às saídas de estoque

Deve acessar o relatório de entrada de estoque
    Dado que o usuário abriu o aplicativo
    Quando acessa o Menu                                   
    Então tem acesso às entradas de estoque

Deve ser possível enviar o inventário de estoque em PDF para o e-mail
    Dado que o usuário abriu o aplicativo
    Quando acessa o inventário de estoque
    Então pode enviar o mesmo por e-mail

Deve ser possível enviar o relatório de saída de estoque por e-mail
    Dado que o usuário abriu o aplicativo
    Quando acessa o relatório de saída de estoque
    Então pode enviar o mesmo por e-mail

Deve ser possível enviar o relatório de entrada de estoque por e-mail
    Dado que o usuário abriu o aplicativo
    Quando acessa o relatório de entrada de estoque
    Então pode enviar o mesmo por e-mail