*** Settings ***
Resource    ../base.robot

*** Variables ***
${TELA_INICIAL}    id=br.com.pztec.estoque:id/Button1
${MENU}    id=br.com.pztec.estoque:id/Button3
${RELATORIOS}    id=br.com.pztec.estoque:id/btn_relatorios
${INVENTARIO_ESTOQUE}    id=br.com.pztec.estoque:id/inventario
${GERAR_INVENTARIO}    id=br.com.pztec.estoque:id/btn_gerar
${PDF}    id=br.com.pztec.estoque:id/datafile
${ENTRADAS_ESTOQUE}    id=br.com.pztec.estoque:id/relentrada
${SAIDAS_ESTOQUE}    id=br.com.pztec.estoque:id/relsaida
${DATA_INICIAL}    id=br.com.pztec.estoque:id/data1
${DATA_FINAL}    id=br.com.pztec.estoque:id/data2
${CONFIRMAR_DATA}    id=android:id/button1
${ENVIAR_EMAIL}    id=br.com.pztec.estoque:id/btn_email
${CONFIRMACAO_EMAIL}    id=com.android.intentresolver:id/icon

*** Keywords ***
Dado que o usuário abriu o aplicativo
    Wait Until Element Is Visible    ${MENU}
    Element Should Be Visible    ${MENU}

Quando acessa o Menu 
    Click Element    ${MENU}
    Wait Until Element Is Visible    ${RELATORIOS}
    Element Should Be Visible    ${RELATORIOS}

Quando acessa o inventário de estoque
    Click Element    ${MENU}
    Wait Until Element Is Visible    ${RELATORIOS}
    Click Element    ${RELATORIOS}
    Wait Until Element Is Visible    ${INVENTARIO_ESTOQUE}
    Click Element    ${INVENTARIO_ESTOQUE}

Quando acessa o relatório de saída de estoque
    Click Element    ${MENU}
    Click Element    ${RELATORIOS}
    Wait Until Element Is Visible    ${SAIDAS_ESTOQUE}
    Click Element    ${SAIDAS_ESTOQUE}
    Wait Until Element Is Visible    ${DATA_INICIAL}
    Click Element    ${DATA_INICIAL}
    Click Element    ${CONFIRMAR_DATA}
    Click Element    ${DATA_FINAL}
    Click Element    ${CONFIRMAR_DATA}
    Click Element    ${GERAR_INVENTARIO}

Quando acessa o relatório de entrada de estoque
    Click Element    ${MENU}
    Click Element    ${RELATORIOS}
    Wait Until Element Is Visible    ${ENTRADAS_ESTOQUE}
    Click Element    ${ENTRADAS_ESTOQUE}
    Wait Until Element Is Visible    ${DATA_INICIAL}
    Click Element    ${DATA_INICIAL}
    Click Element    ${CONFIRMAR_DATA}
    Click Element    ${DATA_FINAL}
    Click Element    ${CONFIRMAR_DATA}
    Click Element    ${GERAR_INVENTARIO}
    
Então tem acesso ao inventário de estoque
    Click Element    ${RELATORIOS}
    Wait Until Element Is Visible    ${INVENTARIO_ESTOQUE}
    Click Element    ${INVENTARIO_ESTOQUE}
    Click Element    ${GERAR_INVENTARIO}
    Element Should Contain Text    ${PDF}    inventory.pdf

Então tem acesso às entradas de estoque
    Click Element    ${RELATORIOS}
    Wait Until Element Is Visible    ${ENTRADAS_ESTOQUE}
    Click Element    ${ENTRADAS_ESTOQUE}
    Wait Until Element Is Visible    ${DATA_INICIAL}
    Click Element    ${DATA_INICIAL}
    Wait Until Element Is Visible    ${CONFIRMAR_DATA}
    Click Element    ${CONFIRMAR_DATA}
    Click Element    ${DATA_FINAL}
    Click Element    ${CONFIRMAR_DATA}
    Click Element    ${GERAR_INVENTARIO}
    Element Should Contain Text    ${PDF}    stockentries.pdf

Então tem acesso às saídas de estoque
    Click Element    ${RELATORIOS}
    Wait Until Element Is Visible    ${SAIDAS_ESTOQUE}
    Click Element    ${SAIDAS_ESTOQUE}
    Wait Until Element Is Visible    ${DATA_INICIAL}
    Click Element    ${DATA_INICIAL}
    Click Element    ${CONFIRMAR_DATA}
    Click Element    ${DATA_FINAL}
    Click Element    ${CONFIRMAR_DATA}
    Click Element    ${GERAR_INVENTARIO}
    Element Should Contain Text    ${PDF}    stockouts.pdf

Então pode enviar o mesmo por e-mail
    Wait Until Element Is Visible    ${GERAR_INVENTARIO}
    Click Element    ${GERAR_INVENTARIO}
    Wait Until Element Is Visible    ${ENVIAR_EMAIL}
    Click Element    ${ENVIAR_EMAIL}
    Wait Until Element Is Visible    ${CONFIRMACAO_EMAIL}

