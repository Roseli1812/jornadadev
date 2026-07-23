

FUNCTION Main()

    LOCAL cEntrada := ""
    LOCAL nNumero := 0
    LOCAL nA := 0
    LOCAL nB := 0
    LOCAL nResultado := 0

    hb_cdpSelect("PT850")
    CLS

    QOut("========================================")
    QOut("       BIBLIOTECA MATEMATICA")
    QOut("========================================")

    QOut("")
    QOut("1 - TESTE DO FATORIAL")
    QOut("----------------------------------------")

    ACCEPT "Informe um numero inteiro nao negativo: " TO cEntrada
    nNumero := Val(AllTrim(cEntrada))

    nResultado := FatorialN(nNumero)

    IF nResultado == -1
        QOut("Nao existe fatorial de numero negativo.")
    ELSE
        QOut("Fatorial de ", nNumero, " = ", nResultado)
    ENDIF

    QOut("")
    QOut("2 - TESTE DE NUMERO PRIMO")
    QOut("----------------------------------------")

    ACCEPT "Informe um numero inteiro: " TO cEntrada
    nNumero := Val(AllTrim(cEntrada))

    IF EhPrimo(nNumero)
        QOut(nNumero, " e um numero primo.")
    ELSE
        QOut(nNumero, " nao e um numero primo.")
    ENDIF

    QOut("")
    QOut("3 - TESTE DO MDC")
    QOut("----------------------------------------")

    ACCEPT "Informe o primeiro numero: " TO cEntrada
    nA := Val(AllTrim(cEntrada))

    ACCEPT "Informe o segundo numero: " TO cEntrada
    nB := Val(AllTrim(cEntrada))

    QOut("MDC de ", nA, " e ", nB, " = ", MDC(nA, nB))

    QOut("")
    QOut("4 - TESTE DO MMC")
    QOut("----------------------------------------")

    ACCEPT "Informe o primeiro numero: " TO cEntrada
    nA := Val(AllTrim(cEntrada))

    ACCEPT "Informe o segundo numero: " TO cEntrada
    nB := Val(AllTrim(cEntrada))

    QOut("MMC de ", nA, " e ", nB, " = ", MMC(nA, nB))

    QOut("")
    QOut("Testes finalizados.")

RETURN NIL

#include "ex04-matematica.prg"