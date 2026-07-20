FUNCTION Main()

    LOCAL cNome := ""
    LOCAL cDisc := ""
    LOCAL cNota := ""
    LOCAL nNota1 := 0
    LOCAL nNota2 := 0
    LOCAL nMedia := 0



    // Valida‡Æo do nome
    DO WHILE .T.

        ACCEPT "Digite o nome do aluno: " TO cNome

        IF Len(AllTrim(cNome)) > 0
            EXIT
        ELSE
            QOut("Nome invalido! Tente novamente.")
        ENDIF

    ENDDO

    // Valida‡Æo da disciplina
    DO WHILE .T.

        ACCEPT "Digite a disciplina (3 letras maiusculas): " TO cDisc

        cDisc := AllTrim(cDisc)

        IF Len(cDisc) == 3 .AND. cDisc == Upper(cDisc)
            EXIT
        ELSE
            QOut("Disciplina invalida! Exemplo: MAT, POR, GEO.")
        ENDIF

    ENDDO

    // Valida‡Æo da primeira nota
    DO WHILE .T.

        ACCEPT "Digite a primeira nota (0 a 10): " TO cNota
        nNota1 := Val(cNota)

        IF nNota1 >= 0 .AND. nNota1 <= 10
            EXIT
        ELSE
            QOut("Nota invalida!")
        ENDIF

    ENDDO

    // Valida‡Æo da segunda nota
    DO WHILE .T.

        ACCEPT "Digite a segunda nota (0 a 10): " TO cNota
        nNota2 := Val(cNota)

        IF nNota2 >= 0 .AND. nNota2 <= 10
            EXIT
        ELSE
            QOut("Nota invalida!")
        ENDIF

    ENDDO

    // C lculo da m‚dia
    nMedia := (nNota1 + nNota2) / 2

    QOut("")
    QOut("===============================")
    QOut("      DADOS DO ALUNO")
    QOut("===============================")
    QOut("Nome       : " + cNome)
    QOut("Disciplina : " + cDisc)
    QOut("Nota 1     : " + Str(nNota1, 5))
    QOut("Nota 2     : " + Str(nNota2, 5))
    QOut("Media      : " + Str(nMedia, 5, 2))

RETURN NIL