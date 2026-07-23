#include "ex11-estoque_lib.prg"

FUNCTION Main()

    LOCAL aProdutos := {}
    LOCAL nOpcao := -1

    hb_cdpSelect("PT850")

    DO WHILE nOpcao <> 0

        CLS

        nOpcao := ExibirMenu()

        DO CASE

        CASE nOpcao == 1
            CadastrarProduto(aProdutos)

        CASE nOpcao == 2
            ListarProdutos(aProdutos)

        CASE nOpcao == 3
            EntradaEstoque(aProdutos)

        CASE nOpcao == 4
            SaidaEstoque(aProdutos)

        CASE nOpcao == 5
            ConsultarProduto(aProdutos)

        CASE nOpcao == 6
            RelatorioEstoque(aProdutos)

        CASE nOpcao == 0
            QOut("")
            QOut("Programa encerrado.")

        OTHERWISE
            QOut("")
            QOut("Opcao invalida.")
            Pausar()

        ENDCASE

    ENDDO

RETURN NIL  