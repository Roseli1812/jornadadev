FUNCTION Main()

    LOCAL nValor := 0
    LOCAL nTotal := 0
    LOCAL nQtd   := 0


    DO WHILE .T.

        ACCEPT "Digite um numero (0 para encerrar): " TO nValor
        nValor := Val(nValor)

        IF nValor == 0
            EXIT
        ENDIF

        nTotal := nTotal + nValor
        nQtd   := nQtd + 1

    ENDDO

    Qout("")   
    QOut("Resultado Final")
    QOut("-------------------------")
    QOut("Soma dos valores : " + Str(nTotal, 10))
    QOut("Quantidade       : " + Str(nQtd, 10))

RETURN NIL