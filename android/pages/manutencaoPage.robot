*** Settings ***
Resource    ../base.robot

*** Variables ***
${MENU}    id=br.com.pztec.estoque:id/Button3
${BACKUP}    id=br.com.pztec.estoque:id/btn_backup
${GERAR}    id=br.com.pztec.estoque:id/btn_gerar
${OK}    id=android:id/button1
${ENVIAR}    id=br.com.pztec.estoque:id/btn_send
${CONFIRMACAO_EMAIL}    id=com.android.intentresolver:id/icon
${RESTORE}    id=br.com.pztec.estoque:id/btn_restore
${ARQUIVO_RESTORE}    id=br.com.pztec.estoque:id/btn_procurar
${BUSCAR_ARQUIVO}    id=android:id/alertTitle
${NOVO_PRODUTO}    id=br.com.pztec.estoque:id/Button1
${CAMPO_DESCRICAO}    id=br.com.pztec.estoque:id/txt_descricao
${CAMPO_QUANTIDADE}    id=br.com.pztec.estoque:id/txt_quantidade
${CAMPO_VALOR}    id=br.com.pztec.estoque:id/txt_valunit
${BOTAO_SALVAR}    id=br.com.pztec.estoque:id/btn_gravar_assunto
${DATA_EXPORT}    id=br.com.pztec.estoque:id/btn_exportar
${PRODUTOS_CSV}    id=br.com.pztec.estoque:id/datafileprod
${SAIDAS_CSV}    id=br.com.pztec.estoque:id/datafilesai
${ENTRADAS_CSV}    id=br.com.pztec.estoque:id/datafileent
${GRUPOS_CSV}    id=br.com.pztec.estoque:id/datafilegrupo
${ENVIAR_CSV_PRODUTOS}    id=br.com.pztec.estoque:id/btn_grupo
${DIMINUIR_QUANTIDADE}    id=br.com.pztec.estoque:id/saida
${AUMENTAR_QUANTIDADE}    id=br.com.pztec.estoque:id/entrada
${TEXTO_DIMINUIR}    id=br.com.pztec.estoque:id/txt_qtdsaida
${TEXTO_AUMENTAR}    id=br.com.pztec.estoque:id/txt_qtdentrada
${SALVAR_QUANTIDADE}    id=br.com.pztec.estoque:id/btn_salvar
${DATA_IMPORT}    id=br.com.pztec.estoque:id/btn_importar
${IMPORTAR_PRODUTOS}    id=br.com.pztec.estoque:id/btn_produtos
${IMPORTAR_ENTRADAS}    id=br.com.pztec.estoque:id/btn_entradas
${IMPORTAR_SAIDAS}    id=br.com.pztec.estoque:id/btn_saidas
${IMPORTAR_GRUPOS}    id=br.com.pztec.estoque:id/btn_saidas
${PASTA_ESTOQUE}    xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]


*** Keywords ***
Dado que o usuário acessou o menu
    Wait Until Element Is Visible    ${MENU}
    Click Element    ${MENU}

Dado que o usuário realizou o cadastro de pelo menos um produto
    Wait Until Element Is Visible    ${NOVO_PRODUTO}
    Click Element    ${NOVO_PRODUTO}
    Wait Until Element Is Visible    ${CAMPO_DESCRICAO}
    [Arguments]    ${descricao}    ${quantidade}    ${valor}
    Click Element    ${CAMPO_DESCRICAO}
    Input Text    ${CAMPO_DESCRICAO}    ${descricao}
    Click Element    ${CAMPO_QUANTIDADE}
    Input Text    ${CAMPO_QUANTIDADE}    ${quantidade}
    Click Element    ${CAMPO_VALOR}
    Input Text    ${CAMPO_VALOR}    ${valor}
    Click Element    ${BOTAO_SALVAR}

E realizou o backup
    Wait Until Element Is Visible    ${BACKUP}
    Click Element    ${BACKUP}
    Wait Until Element Is Visible    ${GERAR}
    Click Element    ${GERAR}
    Wait Until Element Is Visible    ${OK}
    Click Element    ${OK}

E acessou o menu
    Wait Until Element Is Visible    ${MENU}
    Click Element    ${MENU}

E diminuiu a sua quantidade
    Wait Until Element Is Visible    ${DIMINUIR_QUANTIDADE}
    Click Element    ${DIMINUIR_QUANTIDADE}
    Wait Until Element Is Visible    ${TEXTO_DIMINUIR}
    [Arguments]    ${quantidade}
    Click Element    ${TEXTO_DIMINUIR}
    Input Text    ${TEXTO_DIMINUIR}    ${quantidade}
    Click Element    ${SALVAR_QUANTIDADE}

E aumentou a sua quantidade
    Wait Until Element Is Visible    ${AUMENTAR_QUANTIDADE}
    Click Element    ${AUMENTAR_QUANTIDADE}
    Wait Until Element Is Visible    ${TEXTO_AUMENTAR}
    [Arguments]    ${quantidade}
    Click Element    ${TEXTO_AUMENTAR}
    Input Text    ${TEXTO_AUMENTAR}    ${quantidade}
    Click Element    ${SALVAR_QUANTIDADE}

Quando acessa a função de Backup
    Wait Until Element Is Visible    ${BACKUP}
    Click Element    ${BACKUP}

Quando acessa a função de Restore
    Press Keycode    4
    Wait Until Element Is Visible    ${RESTORE}
    Click Element    ${RESTORE}

Quando acessa a função de Data Export
    Wait Until Element Is Visible    ${DATA_EXPORT}
    Click Element    ${DATA_EXPORT}

Quando acessa a função Data Import
    Wait Until Element Is Visible    ${DATA_IMPORT}
    Click Element    ${DATA_IMPORT}

E clica em gerar Data Export
    Wait Until Element Is Visible    ${GERAR}
    Click Element    ${GERAR}
    Wait Until Element Is Visible    ${OK}
    Click Element    ${OK}

Então consegue realizar o Backup das informações do sistema
    Wait Until Element Is Visible    ${GERAR}
    Click Element    ${GERAR}
    Wait Until Element Is Visible    ${OK}
    Click Element    ${OK}

Então consegue restaurar as informações do backup
    Wait Until Element Is Visible    ${ARQUIVO_RESTORE}
    Click Element    ${ARQUIVO_RESTORE}
    Wait Until Element Is Visible    ${BUSCAR_ARQUIVO}
    Element Should Be Visible    ${BUSCAR_ARQUIVO}

Então é gerado um arquivo products.csv
    Wait Until Element Is Visible    ${PRODUTOS_CSV}
    Element Should Contain Text    ${PRODUTOS_CSV}    products.csv

Então é gerado um arquivo stockouts.csv
    Wait Until Element Is Visible    ${SAIDAS_CSV}
    Element Should Contain Text    ${SAIDAS_CSV}    stockouts.csv

Então é gerado um arquivo stockentries.csv
    Wait Until Element Is Visible    ${ENTRADAS_CSV}
    Element Should Contain Text    ${ENTRADAS_CSV}    stockentries.csv

Então é gerado um arquivo group.csv
    Wait Until Element Is Visible    ${GRUPOS_CSV}
    Element Should Contain Text    ${GRUPOS_CSV}    group.csv 

E clica em Product Restore
    Wait Until Element Is Visible    ${IMPORTAR_PRODUTOS}
    Click Element    ${IMPORTAR_PRODUTOS}

E clica em Stock Entries Restore
    Click Element    ${IMPORTAR_ENTRADAS}

E clica em Stock Outs Restore
    Click Element    ${IMPORTAR_SAIDAS}

E clica em Product Group
    Click Element    ${IMPORTAR_GRUPOS}

E enviar o mesmo
    Click Element    ${ENVIAR}
    Wait Until Element Is Visible    ${CONFIRMACAO_EMAIL}
    Element Should Be Visible    ${CONFIRMACAO_EMAIL}

E acessa a pasta Estoque para importar um arquivo
    Swipe By Percent    50    90    50    10
    Wait Until Element Is Visible    ${PASTA_ESTOQUE}
    Click Element    ${PASTA_ESTOQUE}
