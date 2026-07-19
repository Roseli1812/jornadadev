#define PI 3.14159

FUNCTION Main()

   LOCAL nRaio
   LOCAL nArea

   LOCAL nCatetoA
   LOCAL nCatetoB
   LOCAL nHipotenusa

   LOCAL nPeso
   LOCAL nAltura
   LOCAL nIMC


   hb_cdpSelect("PT850")

   CLS

   // ============================
   // µrea do c¡rculo
   // ============================
   ACCEPT "Informe o raio do c¡rculo: " TO nRaio
   nRaio := Val(nRaio)

   nArea := PI * (nRaio ^ 2)

   // ============================
   // Hipotenusa
   // ============================
   ACCEPT "Informe o primeiro cateto: " TO nCatetoA
   nCatetoA := Val(nCatetoA)

   ACCEPT "Informe o segundo cateto: " TO nCatetoB
   nCatetoB := Val(nCatetoB)

   nHipotenusa := Sqrt((nCatetoA ^ 2) + (nCatetoB ^ 2))

   // ============================
   // IMC
   // ============================
   ACCEPT "Informe o peso (kg): " TO nPeso
   nPeso := Val(nPeso)

   ACCEPT "Informe a altura (m): " TO nAltura
   nAltura := Val(nAltura)

   nIMC := nPeso / (nAltura ^ 2)

   QOut(" ")  
   QOut( "===== RESULTADOS =====")
   QOut("µrea do c¡rculo: ", Str(nArea, 10, 2))
   QOut("Hipotenusa:      ", Str(nHipotenusa, 10, 2))
   QOut("IMC:             ", Str(nIMC, 10, 2))

RETURN NIL