FUNCTION FatorialN(nN)

    LOCAL nFatorial := 1
    LOCAL nI

    IF ValType(nN) <> "N"
        RETURN -1
    ENDIF

    IF nN < 0
        RETURN -1
    ENDIF

    FOR nI := 2 TO nN
        nFatorial *= nI
    NEXT

RETURN nFatorial


FUNCTION EhPrimo(nN)

    LOCAL nI

    IF ValType(nN) <> "N" .OR. nN < 2
        RETURN .F.
    ENDIF

    FOR nI := 2 TO Int(Sqrt(nN))
        IF nN % nI == 0
            RETURN .F.
        ENDIF
    NEXT

RETURN .T.


FUNCTION MDC(nA, nB)

    LOCAL nResto

    nA := Abs(nA)
    nB := Abs(nB)

    DO WHILE nB <> 0
        nResto := nA % nB
        nA := nB
        nB := nResto
    ENDDO

RETURN nA


FUNCTION MMC(nA, nB)

    nA := Abs(nA)
    nB := Abs(nB)

    IF nA == 0 .OR. nB == 0
        RETURN 0
    ENDIF

RETURN (nA / MDC(nA, nB)) * nB