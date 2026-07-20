FUNCTION MAIN()

    LOCAL nValor1 := 0
    LOCAL nValor2 := 0
    LOCAL cOperacao := ""
    
 hb_cdpSelect("PT850")

    INPUT "Digite o primeiro valor: " TO nValor1
    ACCEPT "Digite a operaá∆o (+, -, *, /,^ ,R): " TO cOperacao 

  // A raiz quadrada utiliza apenas o primeiro valor.
   IF cOperacao <> "R"
      INPUT "Digite o segundo valor: " TO nValor2
   ENDIF
    
  DO CASE

    CASE cOperacao == "+"
       QOut ( "Resultado : " + Str(nValor1 + nValor2, 10, 2) )
    CASE cOperacao == "-"
        QOut( "Resultado:", Str(nValor1 - nValor2, 10, 2) )
    CASE cOperacao == "*"
        QOut( "Resultado:", Str(nValor1 * nValor2, 10, 2) )
    CASE cOperacao == "/"
         IF nValor2 == 0
        QOut("Erro: n∆o Ç poss°vel dividir por zero!")
        ELSE
        QOut("Resultado: " + Str(nValor1 / nValor2,10,2))
         ENDIF

    CASE cOperacao == "^"
      qOut( "Resultado:", Str(nValor1 ^ nValor2, 10, 2) )
    CASE cOperacao == "R"
      qOut( "Resultado:", Str(Sqrt(nValor1), 10, 2) )

            
    OTHERWISE
            QOut( "Operaá∆o inv†lida!" )
    ENDCASE

    RETURN NIL