FUNCTION Main()

    LOCAL aNumeros := {}
    LOCAL cNumero
    LOCAL nNumero
    LOCAL nI

    hb_cdpSelect("PT850")
    CLS

    QOut("======================================")
    QOut("      BUBBLE SORT - DESAFIO")
    QOut("======================================")
    QOut("")

    // Leitura dos 10 n£meros
    FOR nI := 1 TO 10

        ACCEPT "Digite o " + LTrim(Str(nI)) + "§ numero: " TO cNumero

        nNumero := Val(cNumero)

        AAdd(aNumeros, nNumero)

    NEXT

    QOut("")
    QOut("Vetor original:")

    FOR nI := 1 TO Len(aNumeros)
        QOut(aNumeros[nI])
    NEXT

    // Ordena o vetor
    BubbleSort(@aNumeros)

    QOut("")
    QOut("Vetor ordenado:")

    FOR nI := 1 TO Len(aNumeros)
        QOut(aNumeros[nI])
    NEXT

RETURN NIL


FUNCTION BubbleSort(aVetor)

    LOCAL nI
    LOCAL nJ
    LOCAL nTemp

    FOR nI := 1 TO Len(aVetor) - 1

        FOR nJ := 1 TO Len(aVetor) - nI

            IF aVetor[nJ] > aVetor[nJ + 1]

                nTemp := aVetor[nJ]
                aVetor[nJ] := aVetor[nJ + 1]
                aVetor[nJ + 1] := nTemp

            ENDIF

        NEXT

    NEXT

RETURN NIL