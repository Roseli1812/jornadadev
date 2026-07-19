FUNCTION Main()

   LOCAL cNome
   LOCAL cDataNasc
   LOCAL dDataNasc

   LOCAL nPreco
   LOCAL nIdade

   LOCAL nDesconto := 0
   LOCAL nTotal

   SET DATE BRITISH
   SET CENTURY ON

   // Entrada dos dados
   ACCEPT "Nome do cliente: " TO cNome

   ACCEPT "Data de nascimento (dd/mm/aaaa): " TO cDataNasc
   dDataNasc := CToD(cDataNasc)

   ACCEPT "Pre‡o do produto: " TO nPreco
   nPreco := Val(nPreco)

   // C lculo da idade
   nIdade := Int((Date() - dDataNasc) / 365)

   // Desconto
   IF nIdade > 60
      nDesconto := nPreco * 0.125
   ENDIF

   nTotal := nPreco - nDesconto

   
   QOut (" ")
   QOut ("========== RESUMO ==========")
   QOut ("Cliente........:", cNome)
   QOut ("Idade..........:", Str(nIdade, 3))
   QOut ("Pre‡o..........: R$", Str(nPreco, 10, 2))
   QOut ("Desconto.......: R$", Str(nDesconto, 10, 2))
   QOut ("Total a pagar..: R$", Str(nTotal, 10, 2))

RETURN NIL