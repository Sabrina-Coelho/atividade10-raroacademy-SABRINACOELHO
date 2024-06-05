*** Settings ***
Resource    ../base.robot

*** Variables ***
${TELA_INICIAL}    id=br.com.pztec.estoque:id/scrollView1
${NOVO_PRODUTO}    id=br.com.pztec.estoque:id/Button1
${MENU}    id=br.com.pztec.estoque:id/Button3
${BUSCAR}    id=android:id/search_button
${CAMPO_DESCRICAO}    id=br.com.pztec.estoque:id/txt_descricao
${CAMPO_QUANTIDADE}    id=br.com.pztec.estoque:id/txt_quantidade
${CAMPO_VALOR}    id=br.com.pztec.estoque:id/txt_valunit
${BOTAO_SALVAR}    id=br.com.pztec.estoque:id/btn_gravar_assunto
${PRODUTO_RECENTE}    id=br.com.pztec.estoque:id/linha_parte1
${AUMENTAR_QUANTIDADE}    id=br.com.pztec.estoque:id/entrada
${DIMINUIR_QUANTIDADE}    id=br.com.pztec.estoque:id/saida
${QUANTIDADE}    id=br.com.pztec.estoque:id/txt_quantidade
${SALVAR_ESTOQUE}    id=br.com.pztec.estoque:id/btn_salvar
${CAMPO_DIMINUIR}    id=br.com.pztec.estoque:id/txt_qtdsaida
${CAMPO_AUMENTAR}    id=br.com.pztec.estoque:id/txt_qtdentrada
${BOTAO_EDITAR}    id=br.com.pztec.estoque:id/editar
${EDITAR_DESCRICAO}    id=br.com.pztec.estoque:id/txt_descricao
${SALVAR_ALTERACAO}    id=br.com.pztec.estoque:id/btn_gravar_assunto
${EXCLUIR}    id=br.com.pztec.estoque:id/deletar
${CONFIRMAR_EXCLUSAO}    id=android:id/button1
${BUSCAR}    id=android:id/search_button
${DIGITAR_BUSCA}    id=android:id/search_src_text
${ESTOQUE_INSUFICIENTE}    id=android:id/message

*** Keywords ***
Dado que o usuário acessou o aplicativo
    Wait Until Element Is Visible    ${NOVO_PRODUTO}
    Element Should Be Visible    ${NOVO_PRODUTO}

Quando clica para aumentar a quantidade
    Wait Until Element Is Visible    ${AUMENTAR_QUANTIDADE}
    Click Element    ${AUMENTAR_QUANTIDADE}

Quando ele acessa a funcionalidade de novo produto
    Click Element    ${NOVO_PRODUTO}

Quando clica para diminuir a quantidade
    Wait Until Element Is Visible    ${DIMINUIR_QUANTIDADE}
    Click Element    ${DIMINUIR_QUANTIDADE}

Quando clica para editar o produto
    Wait Until Element Is Visible    ${BOTAO_EDITAR}
    Click Element    ${BOTAO_EDITAR}

Quando clica para deletar o produto
    Wait Until Element Is Visible    ${EXCLUIR}
    Click Element    ${EXCLUIR}

Quando clica para buscar um produto
    Wait Until Element Is Visible    ${BUSCAR}
    Click Element    ${BUSCAR}

E preenche o campo Descrição
    Wait Until Element Is Visible    ${CAMPO_DESCRICAO}
    [Arguments]    ${descricao}
    Click Element    ${CAMPO_DESCRICAO}
    Input Text    ${CAMPO_DESCRICAO}    ${descricao}

E preenche o campo Quantidade
    Wait Until Element Is Visible    ${CAMPO_QUANTIDADE}
    [Arguments]    ${quantidade}
    Click Element    ${CAMPO_QUANTIDADE}
    Input Text    ${CAMPO_QUANTIDADE}    ${quantidade}

E preenche o campo Valor
    Wait Until Element Is Visible    ${CAMPO_VALOR}
    [Arguments]    ${valor}
    Click Element    ${CAMPO_VALOR}
    Input Text    ${CAMPO_VALOR}    ${valor}

E não preenche o campo Descrição
    Click Element    ${CAMPO_DESCRICAO}

E não preenche o campo Quantidade
    Click Element    ${CAMPO_QUANTIDADE}

E não preenche o campo Valor
    Click Element    ${CAMPO_VALOR}

E registrou um produto
    Wait Until Element Is Visible    ${NOVO_PRODUTO}
    Click Element    ${NOVO_PRODUTO}
    [Arguments]    ${descricao}    ${quantidade}    ${valor}
    Wait Until Element Is Visible    ${CAMPO_DESCRICAO}
    Click Element    ${CAMPO_DESCRICAO}
    Input Text    ${CAMPO_DESCRICAO}    ${descricao}
    Wait Until Element Is Visible    ${CAMPO_QUANTIDADE}
    Click Element    ${CAMPO_QUANTIDADE}
    Input Text    ${CAMPO_QUANTIDADE}    ${quantidade}
    Wait Until Element Is Visible    ${CAMPO_VALOR}
    Click Element    ${CAMPO_VALOR}
    Input Text    ${CAMPO_VALOR}    ${valor}
    E clica no botão Salvar

E clica no botão Salvar 
    Click Element    ${BOTAO_SALVAR}

E preenche o campo Aumentar Estoque
    Wait Until Element Is Visible    ${CAMPO_AUMENTAR}
    Click Element    ${CAMPO_AUMENTAR}
    Input Text    ${CAMPO_AUMENTAR}    2

E preenche o campo Diminuir Estoque
    Wait Until Element Is Visible    ${CAMPO_DIMINUIR}
    Click Element    ${CAMPO_DIMINUIR}
    Input Text    ${CAMPO_DIMINUIR}    1

E preenche o campo Diminuir Estoque com 2
    Wait Until Element Is Visible    ${CAMPO_DIMINUIR}
    Click Element    ${CAMPO_DIMINUIR}
    Input Text    ${CAMPO_DIMINUIR}    2
E salvar
    Click Element    ${SALVAR_ESTOQUE}

E muda a descrição para 'Vela de Lavanda'
    Wait Until Element Is Visible    ${EDITAR_DESCRICAO}
    Click Element    ${EDITAR_DESCRICAO}
    Clear Text    ${EDITAR_DESCRICAO}
    Input Text    ${EDITAR_DESCRICAO}    Vela de Lavanda

E clica em Salvar
    Click Element    ${SALVAR_ALTERACAO}

E busca por 'Vela de Lavanda'
    Input Text    ${DIGITAR_BUSCA}    Vela de Lavanda
    Press Keycode    166

Então ele não é redirecionado à página inicial
    Element Should Be Visible    ${CAMPO_DESCRICAO}

Então ele é redirecionado à página inicial
    Wait Until Element Is Visible    ${NOVO_PRODUTO}
    Element Should Be Visible    ${NOVO_PRODUTO}
    Element Should Be Visible    ${NOVO_PRODUTO}

Então a quantidade é aumentada
    Wait Until Element Is Visible    ${QUANTIDADE}
    Element Should Contain Text    ${QUANTIDADE}    3

Então a quantidade é diminuída
    Wait Until Element Is Visible    ${QUANTIDADE}
    Element Should Contain Text    ${QUANTIDADE}    1

Então a mensagem 'Estoque Insuficiente' é exibida
    Wait Until Element Is Visible    ${ESTOQUE_INSUFICIENTE}
    Element Should Contain Text    ${ESTOQUE_INSUFICIENTE}    Insufficient stock

Então a descrição do produto é alterada
    Wait Until Element Is Visible    ${CAMPO_DESCRICAO}
    Element Should Contain Text    ${CAMPO_DESCRICAO}    Vela de Lavanda

Então o produto não é mais listado
    Wait Until Element Is Visible    ${NOVO_PRODUTO}
    Element Should Not Contain Text    ${TELA_INICIAL}    ID

Então o produto é mostrado na tela
    Element Should Contain Text    ${CAMPO_DESCRICAO}    Vela de Lavanda

E o produto não é listado
    Press Keycode    4
    Element Should Not Contain Text    ${TELA_INICIAL}    ID

E o novo produto é listado
    Element Should Be Visible    ${PRODUTO_RECENTE}

E confirma a exclusão
    Wait Until Element Is Visible    ${CONFIRMAR_EXCLUSAO}
    Click Element    ${CONFIRMAR_EXCLUSAO}

Criar um produto e confirmar sua existência
    Dado que o usuário acessou o aplicativo
    Quando ele acessa a funcionalidade de novo produto
    Wait Until Element Is Visible    ${CAMPO_DESCRICAO}
    [Arguments]    ${descricao}    ${quantidade}    ${valor}
    Click Element    ${CAMPO_DESCRICAO}
    Input Text    ${CAMPO_DESCRICAO}    ${descricao}
    Wait Until Element Is Visible    ${CAMPO_QUANTIDADE}
    Click Element    ${CAMPO_QUANTIDADE}
    Input Text    ${CAMPO_QUANTIDADE}    ${quantidade}
    Wait Until Element Is Visible    ${CAMPO_VALOR}
    Click Element    ${CAMPO_VALOR}
    Input Text    ${CAMPO_VALOR}    ${valor}
    E clica no botão Salvar
    Então ele é redirecionado à página inicial
    E o novo produto é listado
    