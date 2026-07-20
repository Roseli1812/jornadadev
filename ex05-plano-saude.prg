FUNCTION Main()

   LOCAL nIdade         := 0
   LOCAL nDependentes   := 0
   LOCAL nValorPlano    := 0
   LOCAL nValorTotal    := 0

   hb_cdpSelect("PT850")

   INPUT "Digite a idade: " TO nIdade
   INPUT "Digite a quantidade de dependentes: " TO nDependentes

   IF nIdade <= 25
      nValorPlano := 180

   ELSEIF nIdade <= 40
      nValorPlano := 260

   ELSEIF nIdade <= 60
      nValorPlano := 380

   ELSE
      nValorPlano := 520

   ENDIF

   nValorTotal := nValorPlano + ( nDependentes * 90 )

   QOut("")
   QOut("===== PLANO DE SAéDE =====")
   QOut("Idade             : " + (Str(nIdade)))
   QOut("Dependentes       : " + (Str(nDependentes)))
   QOut("Valor do plano    : R$ " + Str(nValorPlano, 10,2 ))
   QOut("Valor adicional   : R$ " + Str(nDependentes * 90))
   QOut("Valor total       : R$ " + Str(nValorTotal, 10, 2))

RETURN NIL  