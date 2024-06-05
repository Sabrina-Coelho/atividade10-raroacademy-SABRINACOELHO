*** Settings ***
Resource    ../base.robot
Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***
Deve registrar um novo produto com sucesso
    Dado que o usuário acessou o aplicativo
    Quando ele acessa a funcionalidade de novo produto
    E preenche o campo Descrição    Vela
    E preenche o campo Quantidade    5
    E preenche o campo Valor    20
    E clica no botão Salvar
    Então ele é redirecionado à página inicial
    E o novo produto é listado

Não deve salvar o produto ao tentar registrar sem preencher o campo Descrição
    Dado que o usuário acessou o aplicativo
    Quando ele acessa a funcionalidade de novo produto
    E preenche o campo Quantidade    5
    E preenche o campo Valor    10
    E não preenche o campo Descrição
    E clica no botão Salvar
    Então ele não é redirecionado à página inicial
    E o produto não é listado
  
Não deve salvar o produto ao tentar registrar sem preencher o campo Quantidade
    Dado que o usuário acessou o aplicativo
    Quando ele acessa a funcionalidade de novo produto
    E preenche o campo Descrição    Incenso de Lavanda
    E preenche o campo Valor    20
    E não preenche o campo Quantidade
    E clica no botão Salvar
    Então ele não é redirecionado à página inicial
    E o produto não é listado
  
Não deve salvar o produto ao tentar registrar sem preencher o campo Valor
    Dado que o usuário acessou o aplicativo
    Quando ele acessa a funcionalidade de novo produto
    E preenche o campo Descrição    Incenso de Pêssego
    E preenche o campo Quantidade    15
    E não preenche o campo Valor
    E clica no botão Salvar
    Então ele não é redirecionado à página inicial
    E o produto não é listado

Deve ser possível cadastrar produtos com valores variáveis
    [Template]    Criar um produto e confirmar sua existência
    Incenso de Hortelã    15    20
    Kit Incenso 3 Variedades    1    10
    Porta-Incenso Flores    120    110
    
Deve ser possível alterar a quantidade do produto para mais
    Dado que o usuário acessou o aplicativo
    E registrou um produto    Incenso de Morango    1    20
    Quando clica para aumentar a quantidade
    E preenche o campo Aumentar Estoque
    E salvar
    Então a quantidade é aumentada

Deve ser possível alterar a quantidade do produto para menos
    Dado que o usuário acessou o aplicativo
    E registrou um produto    Incenso de Morango    2    20
    Quando clica para diminuir a quantidade
    E preenche o campo Diminuir Estoque
    E salvar
    Então a quantidade é diminuída

Não deve ser possível deixar a quantidade do produto negativa
    Dado que o usuário acessou o aplicativo
    E registrou um produto    Incenso de Morango    1    20
    Quando clica para diminuir a quantidade
    E preenche o campo Diminuir Estoque com 2
    E salvar
    Então a mensagem 'Estoque Insuficiente' é exibida

É possível editar as informações de um produto
    Dado que o usuário acessou o aplicativo
    E registrou um produto    Incenso de Morango    1    20
    Quando clica para editar o produto
    E muda a descrição para 'Vela de Lavanda'
    E clica em Salvar
    Então a descrição do produto é alterada

É possível deletar um produto
    Dado que o usuário acessou o aplicativo
    E registrou um produto    Incenso de Morango    1    20
    Quando clica para deletar o produto
    E confirma a exclusão
    Então o produto não é mais listado

É possível buscar por um produto cadastrado
    Dado que o usuário acessou o aplicativo
    E registrou um produto    Incenso de Morango    1    20
    E registrou um produto    Vela de Lavanda    2    30
    Quando clica para buscar um produto
    E busca por 'Vela de Lavanda'
    Então o produto é mostrado na tela