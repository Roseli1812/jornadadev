// Exercício 5 - Tratamento de Erro (Harbour Puro)

FUNCTION Main()

    LOCAL nA := 10
    LOCAL nB := 0
    LOCAL nRes
    LOCAL oErro
    
   hb_cdpSelect("PT850")

    BEGIN SEQUENCE

        IF nB == 0
            oErro := ErrorNew()
            oErro:Description := "Tentativa de divisão por zero"
            BREAK oErro
        ENDIF

        nRes := nA / nB

        QOut("Resultado: " + Str(nRes))

    RECOVER USING oErro

        QOut("Erro capturado: " + oErro:Description)

    END SEQUENCE

    QOut("O programa continua de pe!")

RETURN NIL
