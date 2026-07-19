FUNCTION Main()

   LOCAL cNota1
   LOCAL cNota2
   LOCAL cNota3
   LOCAL cNota4

   LOCAL nNota1
   LOCAL nNota2
   LOCAL nNota3
   LOCAL nNota4

   LOCAL nMedia

   // Entrada das notas
   ACCEPT "Digite a 1¦ nota: " TO cNota1
   nNota1 := Val(cNota1)

   ACCEPT "Digite a 2¦ nota: " TO cNota2
   nNota2 := Val(cNota2)

   ACCEPT "Digite a 3¦ nota: " TO cNota3
   nNota3 := Val(cNota3)

   ACCEPT "Digite a 4¦ nota: " TO cNota4
   nNota4 := Val(cNota4)

   // C lculo da m‚dia ponderada
   nMedia := (nNota1 * 1 + ;
              nNota2 * 2 + ;
              nNota3 * 3 + ;
              nNota4 * 4) / 10

   // Exibi‡Æo do resultado
   ? ""
   ? "===== RESULTADO ====="
   ? "M‚dia Ponderada:", Str(nMedia, 10, 2)

RETURN NIL