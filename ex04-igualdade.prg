FUNCTION Main()

   LOCAL cTexto1 := "Harbour"
   LOCAL cTexto2 := "Harb"

   QOut ("Comparando:", cTexto1, "e", cTexto2)
   QOut ("")

   QOut ("Usando '=' :", cTexto1 = cTexto2)
   QOut ("Usando '==':", cTexto1 == cTexto2)

RETURN NIL