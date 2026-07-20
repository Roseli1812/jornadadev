FUNCTION Main()

   LOCAL nCont := 0

   QOut("a) N£meros de 1 a 100:")
   FOR nCont := 1 TO 100
      QQOut( Str(nCont, 5))
   NEXT
   QOut(" ")

   QOut("============================================================================================")

   QOut(" ")
   QOut("b) N£meros de -50 a 50:")
   FOR nCont := -50 TO 50
      QQOut( Str(nCont, 5))
   NEXT
   QOut(" ")

    QOut("============================================================================================")

   QOut(" ")
   QOut(" N£meros de 80 a 5 (decrescente):")
   FOR nCont := 80 TO 5 STEP -1
      QQOut( Str(nCont, 5))
   NEXT
   QOut(" ")

RETURN NIL