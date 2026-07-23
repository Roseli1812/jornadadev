FUNCTION Main()

    LOCAL aAlunos := {}
    LOCAL aAluno
    LOCAL cNome
    LOCAL cAux
    LOCAL nAlunos
    LOCAL nNota1
    LOCAL nNota2
    LOCAL nNota3
    LOCAL nNota4
    LOCAL nMedia
    LOCAL nI

    hb_cdpSelect("PT850")
    CLS

    QOut("======================================")
    QOut(" SISTEMA DE NOTAS ")
    QOut("======================================")
    QOut("")

    ACCEPT "Quantidade de alunos: " TO cAux
    nAlunos := Val(cAux)

    FOR nI := 1 TO nAlunos

        QOut("")
        QOut("Aluno ", nI)

        ACCEPT "Nome: " TO cNome

        ACCEPT "Nota 1: " TO cAux
        nNota1 := Val(cAux)

        ACCEPT "Nota 2: " TO cAux
        nNota2 := Val(cAux)

        ACCEPT "Nota 3: " TO cAux
        nNota3 := Val(cAux)

        ACCEPT "Nota 4: " TO cAux
        nNota4 := Val(cAux)

        aAluno := { cNome, nNota1, nNota2, nNota3, nNota4 }

        AAdd(aAlunos, aAluno)

    NEXT

    CLS

    QOut("======================================")
    QOut("APROVADOS")
    QOut("======================================")
    QOut("")

    FOR nI := 1 TO Len(aAlunos)

        nMedia := ( ;
            aAlunos[nI][2] + ;
            aAlunos[nI][3] + ;
            aAlunos[nI][4] + ;
            aAlunos[nI][5] ) / 4

        IF nMedia >= 7
            QOut("Nome : ", aAlunos[nI][1])
            QOut("Media: ", Transform(nMedia, "@E 999.99"))
            QOut("------------------------------")
        ENDIF

    NEXT

    QOut("")
    QOut("======================================")
    QOut("REPROVADOS")
    QOut("======================================")
    QOut("")

    FOR nI := 1 TO Len(aAlunos)

        nMedia := ( ;
            aAlunos[nI][2] + ;
            aAlunos[nI][3] + ;
            aAlunos[nI][4] + ;
            aAlunos[nI][5] ) / 4

        IF nMedia < 7
            QOut("Nome : ", aAlunos[nI][1])
            QOut("Media: ", Transform(nMedia, "@E 999.99"))
            QOut("------------------------------")
        ENDIF

    NEXT

RETURN NIL