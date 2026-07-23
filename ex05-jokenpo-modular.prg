FUNCTION Main()

   LOCAL cJogadaUsuario
   LOCAL cJogadaCPU
   LOCAL cResultado
   LOCAL cContinuar := "S"

   DO WHILE Upper(cContinuar) == "S"

      CLS

      QOut("==================================")
      QOut("             JOKENPO")
      QOut("==================================")
      QOut("")
      QOut("Escolha: PEDRA, PAPEL ou TESOURA")
      QOut("")

      ACCEPT "Sua jogada: " TO cJogadaUsuario

      cJogadaUsuario := Upper(AllTrim(cJogadaUsuario))

      DO WHILE ! ValidarJogada(cJogadaUsuario)

         QOut("")
         QOut("Jogada invalida!")
         QOut("Digite PEDRA, PAPEL ou TESOURA.")

         ACCEPT "Sua jogada: " TO cJogadaUsuario

         cJogadaUsuario := Upper(AllTrim(cJogadaUsuario))

      ENDDO

      cJogadaCPU := SortearJogadaCPU()
      cResultado := DefinirVencedor(cJogadaUsuario, cJogadaCPU)

      MostrarResultado(cJogadaUsuario, cJogadaCPU, cResultado)

      QOut("")
      ACCEPT "Deseja jogar novamente? (S/N): " TO cContinuar

      cContinuar := Upper(AllTrim(cContinuar))

   ENDDO

   QOut("")
   QOut("Jogo encerrado!")

RETURN NIL


// Sorteia a jogada do computador
FUNCTION SortearJogadaCPU()

   LOCAL nJogada

   nJogada := HB_RandomInt(1, 3)

   DO CASE

   CASE nJogada == 1
      RETURN "PEDRA"

   CASE nJogada == 2
      RETURN "PAPEL"

   OTHERWISE
      RETURN "TESOURA"

   ENDCASE

RETURN NIL


// Verifica se a jogada informada ‚ v lida
FUNCTION ValidarJogada(cJogada)

   cJogada := Upper(AllTrim(cJogada))

   IF cJogada == "PEDRA" .OR. ;
      cJogada == "PAPEL" .OR. ;
      cJogada == "TESOURA"

      RETURN .T.

   ENDIF

RETURN .F.


// Define o vencedor da partida
FUNCTION DefinirVencedor(cJogada1, cJogada2)

   IF cJogada1 == cJogada2
      RETURN "EMPATE"
   ENDIF

   IF cJogada1 == "PEDRA" .AND. cJogada2 == "TESOURA"
      RETURN "JOGADOR"
   ENDIF

   IF cJogada1 == "PAPEL" .AND. cJogada2 == "PEDRA"
      RETURN "JOGADOR"
   ENDIF

   IF cJogada1 == "TESOURA" .AND. cJogada2 == "PAPEL"
      RETURN "JOGADOR"
   ENDIF

RETURN "COMPUTADOR"


// Exibe as jogadas e o resultado
FUNCTION MostrarResultado(cJogadaUsuario, cJogadaCPU, cResultado)

   QOut("")
   QOut("----------------------------------")
   QOut("Jogador    : " + cJogadaUsuario)
   QOut("Computador : " + cJogadaCPU)
   QOut("----------------------------------")

   DO CASE

   CASE cResultado == "EMPATE"
      QOut("Resultado: empate!")

   CASE cResultado == "JOGADOR"
      QOut("Resultado: voce venceu!")

   OTHERWISE
      QOut("Resultado: computador venceu!")

   ENDCASE

RETURN NIL