FUNCTION Main()

    LOCAL nValor

    ACCEPT "Digite um numero inteiro (0 ou negativo para sair): " TO nValor
    nValor := Val(nValor)

    DO WHILE nValor > 0

        QOut("Dobro: " + Str(nValor * 2, 10))

        ACCEPT "Digite outro numero (0 ou negativo para sair): " TO nValor
        nValor := Val(nValor)

    ENDDO

    QOut("Programa encerrado.")

RETURN NIL