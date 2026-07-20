Function Main()

    LOCAL nValor1 := 0
    LOCAL nValor2 := 0

    hb_cdpSelect("PT850")

    // Entrada dos dados
    ACCEPT "Digite o primeiro valor: " TO nValor1
    ACCEPT "Digite o segundo valor: " TO nValor2

    // Verifica se os valores sÆo iguais
    IF nValor1 == nValor2

        QOut( "Os dois valores sÆo iguais.")

    ELSE

        // Descobre qual ‚ o maior e o menor
        IF nValor1 > nValor2

            QOut( "Maior valor:", nValor1 )
            QOut( "Menor valor:", nValor2 )

        ELSE

            QOut( "Maior valor:", nValor2 )
            QOut( "Menor valor:", nValor1 )

        ENDIF

    ENDIF

RETURN NIL