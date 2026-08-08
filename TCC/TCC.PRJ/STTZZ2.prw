#Include "Protheus.ch"

User Function STTZZ2()

    Private cCadastro
    Private aRotina
    Private aCores

    cCadastro := "Ocorrencias de Fornecedor"
    aRotina    := {}
    aCores     := {}

    AAdd(aRotina, {"Pesquisar" , "AxPesqui", 0, 1})
    AAdd(aRotina, {"Visualizar", "AxVisual", 0, 2})
    AAdd(aRotina, {"Incluir"   , "AxInclui", 0, 3})
    AAdd(aRotina, {"Alterar"   , "AxAltera", 0, 4})
    AAdd(aRotina, {"Excluir"   , "AxDeleta", 0, 5})

    // Vermelho: percentual acima da tolerancia
    AAdd(aCores, {;
        "(ZZ2->ZZ2_QTDOK + ZZ2->ZZ2_QTDNOK) > 0 .AND. " +;
        "U_STTPNC(ZZ2->ZZ2_QTDOK, ZZ2->ZZ2_QTDNOK) > " +;
        "Posicione('ZZ1', 1, " +;
        "xFilial('ZZ1') + ZZ2->ZZ2_CONFOR, " +;
        "'ZZ1_TOLERA')",;
        "BR_VERMELHO";
    })

    // Verde: demais registros
    AAdd(aCores, {".T.", "BR_VERDE"})

    DbSelectArea("ZZ2")
    DbSetOrder(1)
    DbGoTop()

    mBrowse(6, 1, 22, 75, "ZZ2")

Return Nil