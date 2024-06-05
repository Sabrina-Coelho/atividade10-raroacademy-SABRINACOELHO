*** Settings ***
Resource    ../base.robot
Resource    ../pages/manutencaoPage.robot
Test Setup    Abrir App
Test Teardown    Teardown


*** Test Cases ***
Deve realizar o Backup das informações do sistema
    Dado que o usuário acessou o menu
    Quando acessa a função de Backup
    Então consegue realizar o Backup das informações do sistema
    E enviar o mesmo

Deve ser possível realizar o Restore após realizar o backup
    Dado que o usuário acessou o menu
    E realizou o backup
    Quando acessa a função de Restore
    Então consegue restaurar as informações do backup

Deve ser possível importar os registros de produto para um arquivo.csv
    Dado que o usuário realizou o cadastro de pelo menos um produto    Vela de Baunilha    7    20
    E acessou o menu
    Quando acessa a função de Data Export
    E clica em gerar Data Export
    Então é gerado um arquivo products.csv

Deve ser possível importar os registros de saídas para um arquivo.csv
    Dado que o usuário realizou o cadastro de pelo menos um produto    Vela de Baunilha    7    20
    E diminuiu a sua quantidade    5
    E acessou o menu
    Quando acessa a função de Data Export
    E clica em gerar Data Export
    Então é gerado um arquivo stockouts.csv

Deve ser possível importar os registros de entradas para um arquivo.csv
    Dado que o usuário realizou o cadastro de pelo menos um produto    Vela de Baunilha    7    20
    E aumentou a sua quantidade    9
    E acessou o menu
    Quando acessa a função de Data Export
    E clica em gerar Data Export
    Então é gerado um arquivo stockentries.csv

Deve ser possível importar os registros de grupo de produtos para um arquivo.csv
    Dado que o usuário realizou o cadastro de pelo menos um produto    Vela de Baunilha    7    20
    E acessou o menu
    Quando acessa a função de Data Export
    E clica em gerar Data Export
    Então é gerado um arquivo group.csv

Deve ser possível importar novos produtos
    Dado que o usuário realizou o cadastro de pelo menos um produto    Vela de Baunilha    7    20
    E acessou o menu
    Quando acessa a função Data Import 
    E clica em Product Restore
    E acessa a pasta Estoque para importar um arquivo

Deve ser possível importar as entradas de produtos
    Dado que o usuário realizou o cadastro de pelo menos um produto    Vela de Baunilha    7    20
    E aumentou a sua quantidade    9
    E acessou o menu
    Quando acessa a função Data Import 
    E clica em Stock Entries Restore
    E acessa a pasta Estoque para importar um arquivo

Deve ser possível importar as saídas de produtos
    Dado que o usuário realizou o cadastro de pelo menos um produto    Vela de Baunilha    7    20
    E diminuiu a sua quantidade    5
    E acessou o menu
    Quando acessa a função Data Import 
    E clica em Stock Outs Restore
    E acessa a pasta Estoque para importar um arquivo

Deve ser possível importar os grupos de produtos
    Dado que o usuário realizou o cadastro de pelo menos um produto    Vela de Baunilha    7    20
    E acessou o menu
    Quando acessa a função Data Import 
    E clica em Product Group
    E acessa a pasta Estoque para importar um arquivo

