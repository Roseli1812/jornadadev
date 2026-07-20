FUNCTION MAIIN()

    LOCAL nNumeroMes := 0  
    LOCAL cMes := { ;
      "Janeiro", "Fevereiro", "Mar‡o", "Abril", ;
      "Maio", "Junho", "Julho", "Agosto", ;
      "Setembro", "Outubro", "Novembro", "Dezembro" }

      hb_cdpSelect("PT850")

    INPUT "Digite o n£mero do mˆs (1 a 12): " TO nNumeroMes
    

   IF nNumeroMes >= 1 .AND. nNumeroMes <= 12
      QOut( cMes[nNumeroMes] )
   ELSE
      QOut( "Mˆs inv lido!" )
   ENDIF

RETURN NIL

   








RETURN NIL   


