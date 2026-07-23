FUNCTION Main()

    LOCAL aDias := { ;
        "Domingo", ;
        "Segunda-feira", ;
        "Ter‡a-feira", ;
        "Quarta-feira", ;
        "Quinta-feira", ;
        "Sexta-feira", ;
        "S bado" ;
    }

    LOCAL nIndice

    hb_cdpSelect("PT850")
    

    QOut( "=========================================")
    QOut("      DIAS DA SEMANA ")
    Qout("=========================================")

    ACCEPT "Informe um numero de 1 a 7: " TO nIndice
    nIndice := Val(nIndice)

    IF nIndice >= 1 .AND. nIndice <= Len(aDias)
        QOut("")
        QOut("Dia correspondente: ", aDias[nIndice])
    ELSE
        QOut("")
        QOut("Indice invalido! Informe um numero entre 1 e 7.")
    ENDIF

    RETURN NIL