FUNCTION Main()

    LOCAL aProdutos := { ;
        {"Teclado",    120.00}, ;
        {"Mouse",       65.50}, ;
        {"Monitor",    950.00}, ;
        {"Headset",    210.90}, ;
        {"Webcam",     180.00} ;
    }

    LOCAL aCarrinho := {}
    LOCAL cOpcao
    LOCAL nOpcao
    LOCAL nI
    LOCAL nTotal := 0

    hb_cdpSelect("PT850")
    CLS

    QOut("====================================")
    QOut("     MINI CARRINHO DE COMPRAS")
    QOut("====================================")

    DO WHILE .T.

        QOut("")
        QOut("Produtos dispon¡veis:")
        QOut("-------------------------------")

        FOR nI := 1 TO Len(aProdutos)
            QOut( ;
                LTrim(Str(nI)) + " - " + ;
                aProdutos[nI][1] + ;
                " - R$ " + ;
                Transform(aProdutos[nI][2], "@E 9,999.99") )
        NEXT

        QOut("")
        ACCEPT "Escolha o produto (1 a 5): " TO cOpcao

        nOpcao := Val(cOpcao)

        IF nOpcao >= 1 .AND. nOpcao <= Len(aProdutos)

            AAdd(aCarrinho, aProdutos[nOpcao])

            QOut("Produto adicionado ao carrinho!")

        ELSE

            QOut("Produto inv lido!")

        ENDIF

        QOut("")
        ACCEPT "Deseja adicionar outro produto? (S/N): " TO cOpcao

        IF Upper(cOpcao) <> "S"
            EXIT
        ENDIF

    ENDDO

    CLS

    QOut("====================================")
    QOut("       ITENS DO CARRINHO")
    QOut("====================================")

    FOR nI := 1 TO Len(aCarrinho)

        QOut( ;
            aCarrinho[nI][1] + ;
            " - R$ " + ;
            Transform(aCarrinho[nI][2], "@E 9,999.99") )

        nTotal += aCarrinho[nI][2]

    NEXT

    QOut("------------------------------------")
    QOut("TOTAL DA COMPRA: R$ ", ;
         Transform(nTotal, "@E 9,999.99"))

RETURN NIL