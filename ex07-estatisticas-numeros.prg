FUNCTION Main()

    LOCAL aNumeros := {}
    LOCAL cNumero
    LOCAL nNumero
    LOCAL nSoma := 0
    LOCAL nMedia
    LOCAL nI

    hb_cdpSelect("PT850")
    CLS

    QOut("========================================")
    QOut("      ESTATISTICAS DE 10 NUMEROS")
    QOut("========================================")
    QOut("")

    // Leitura dos 10 n£meros
    FOR nI := 1 TO 10

        ACCEPT "Digite o " + LTrim(Str(nI)) + "§ numero: " TO cNumero

        nNumero := Val(cNumero)

        AAdd(aNumeros, nNumero)

        nSoma += nNumero

    NEXT

    // Ordena o array em ordem crescente
    ASort(aNumeros)

    // Calcula a m‚dia
    nMedia := nSoma / Len(aNumeros)

    CLS

    QOut("========================================")
    QOut("              RESULTADO")
    QOut("========================================")
    QOut("")

    QOut("Numeros em ordem crescente:")

    FOR nI := 1 TO Len(aNumeros)
        QOut(aNumeros[nI])
    NEXT

    QOut("")
    QOut("Soma........: ", nSoma)
    QOut("Media.......: ", Transform(nMedia, "@E 999,999.99"))
    QOut("Menor valor.: ", aNumeros[1])
    QOut("Maior valor.: ", aNumeros[Len(aNumeros)])

RETURN NIL