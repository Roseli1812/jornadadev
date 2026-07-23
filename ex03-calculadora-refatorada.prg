FUNCTION Main()

   LOCAL nValor1
   LOCAL nValor2
   LOCAL cOperacao
   LOCAL uResultado

   nValor1   := LerNumero("Digite o primeiro valor: ")
   cOperacao := LerOperacao()
   nValor2   := LerNumero("Digite o segundo valor: ")

   uResultado := Calcular(nValor1, nValor2, cOperacao)

   MostrarResultado(uResultado)

RETURN NIL


FUNCTION LerNumero(cMensagem)

   LOCAL cValor

   QOut(cMensagem)
   ACCEPT TO cValor

RETURN Val(cValor)


FUNCTION LerOperacao()

   LOCAL cOperacao

   QOut("Digite a operacao (+, -, *, /): ")
   ACCEPT TO cOperacao

RETURN AllTrim(cOperacao)


FUNCTION Calcular(nValor1, nValor2, cOperacao)

   LOCAL uResultado := NIL

   DO CASE

   CASE cOperacao == "+"
      uResultado := nValor1 + nValor2

   CASE cOperacao == "-"
      uResultado := nValor1 - nValor2

   CASE cOperacao == "*"
      uResultado := nValor1 * nValor2

   CASE cOperacao == "/"

      IF nValor2 == 0
         RETURN .F.
      ENDIF

      uResultado := nValor1 / nValor2

   OTHERWISE
      RETURN .F.

   ENDCASE

RETURN uResultado


FUNCTION MostrarResultado(uResultado)

   IF ValType(uResultado) == "L"

      QOut("Nao foi possivel realizar o calculo.")
      QOut("Operacao invalida ou divisao por zero.")

   ELSE

      QOut("Resultado: " + LTrim(Str(uResultado)))

   ENDIF

RETURN NIL