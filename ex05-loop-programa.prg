FUNCTION Main()

    LOCAL cNome := ""
    LOCAL cDisc := ""
    LOCAL cNota := ""
    LOCAL cResp := ""
    LOCAL nNota1 := 0
    LOCAL nNota2 := 0
    LOCAL nMedia := 0


    DO WHILE .T.

        // Limpa as vari veis para um novo aluno
        cNome  := ""
        cDisc  := ""
        nNota1 := 0
        nNota2 := 0

        // Nome
        DO WHILE .T.

            ACCEPT "Digite o nome do aluno: " TO cNome

            IF Len(AllTrim(cNome)) > 0
                EXIT
            ELSE
                QOut("Nome invalido!")
            ENDIF

        ENDDO

        // Disciplina
        DO WHILE .T.

            ACCEPT "Digite a disciplina (3 letras maiusculas): " TO cDisc
            cDisc := AllTrim(cDisc)

            IF Len(cDisc) == 3 .AND. cDisc == Upper(cDisc)
                EXIT
            ELSE
                QOut("Disciplina invalida!")
            ENDIF

        ENDDO

        // Nota 1
        DO WHILE .T.

            ACCEPT "Digite a primeira nota: " TO cNota
            nNota1 := Val(cNota)

            IF nNota1 >= 0 .AND. nNota1 <= 10
                EXIT
            ELSE
                QOut("Nota invalida!")
            ENDIF

        ENDDO

        // Nota 2
        DO WHILE .T.

            ACCEPT "Digite a segunda nota: " TO cNota
            nNota2 := Val(cNota)

            IF nNota2 >= 0 .AND. nNota2 <= 10
                EXIT
            ELSE
                ? "Nota invalida!"
            ENDIF

        ENDDO

        // M‚dia
        nMedia := (nNota1 + nNota2) / 2

        QOut("")
        QOut("==============================")
        QOut("      DADOS DO ALUNO")
        QOut("==============================")
        QOut("Nome.......: " + cNome)
        QOut("Disciplina.: " + cDisc)
        QOut("Nota 1.....: " + Str(nNota1, 5))
        QOut("Nota 2.....: " + Str(nNota2, 5))
        QOut("Media......: " + Str(nMedia, 5, 2))
        QOut("")

        // Pergunta se deseja continuar
        DO WHILE .T.

            ACCEPT "Deseja calcular outro? (S/N): " TO cResp
            cResp := Upper(AllTrim(cResp))

            IF cResp == "S" .OR. cResp == "N"
                EXIT
            ELSE
                QOut("Resposta invalida! Digite S ou N.")
            ENDIF

        ENDDO

        IF cResp == "N"
            EXIT
        ENDIF

        

    ENDDO

    QOut("")
    QOut("Programa encerrado.")

RETURN NIL