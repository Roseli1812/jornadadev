FUNCTION Main()

    LOCAL nSecreto := HB_RandomInt(1, 100)
    LOCAL nPalpite := 0
    LOCAL nI       := 0
    LOCAL cEntrada := ""
    LOCAL lAcertou := .F.


    QOut("==================================")
    QOut("      ADIVINHE O NUMERO")
    QOut("==================================")
    QOut("O numero secreto esta entre 1 e 100.")
    QOut("Voce possui 7 tentativas.")
    QOut("")

    FOR nI := 1 TO 7

        ACCEPT "Digite seu palpite: " TO cEntrada
        nPalpite := Val(AllTrim(cEntrada))

        IF nPalpite < 1 .OR. nPalpite > 100

            QOut("Palpite invalido! Digite um numero entre 1 e 100.")

        ELSEIF nPalpite == nSecreto

            lAcertou := .T.

            QOut("")
            QOut("Parabens! Voce acertou!")
            QOut("Tentativas utilizadas:", nI)

            EXIT

        ELSEIF nPalpite < nSecreto

            QOut("O numero secreto e MAIOR que", nPalpite)

        ELSE

            QOut("O numero secreto e MENOR que", nPalpite)

        ENDIF

        QOut("Tentativas restantes:", 7 - nI)
        QOut("")

    NEXT

    QOut("")
    QOut("==================================")

    IF lAcertou
        QOut("Resultado: voce venceu!")
    ELSE
        QOut("Resultado: suas tentativas acabaram.")
    ENDIF

    QOut("O numero secreto era:", nSecreto)
    QOut("==================================")

RETURN NIL