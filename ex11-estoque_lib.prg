FUNCTION ExibirMenu()

    LOCAL nOpcao

    QOut("==========================================")
    QOut("     CONTROLE DE ESTOQUE SIMPLIFICADO")
    QOut("==========================================")
    QOut("")
    QOut("1 - Cadastrar produto")
    QOut("2 - Listar produtos")
    QOut("3 - Entrada de estoque")
    QOut("4 - Saida de estoque")
    QOut("5 - Buscar produto por codigo")
    QOut("6 - Relatorio de valor em estoque")
    QOut("0 - Sair")
    QOut("")

    nOpcao := LerNumeroInteiro("Escolha uma opcao: ", 0, 6)

RETURN nOpcao


FUNCTION CadastrarProduto(aProdutos)

    LOCAL cCodigo
    LOCAL cNome
    LOCAL nQuantidade
    LOCAL nPreco
    LOCAL nPosicao

    CLS

    QOut("==========================================")
    QOut("          CADASTRO DE PRODUTO")
    QOut("==========================================")
    QOut("")

    cCodigo := LerTextoObrigatorio("Codigo do produto: ")

    nPosicao := BuscarProduto(aProdutos, cCodigo)

    IF nPosicao > 0
        QOut("")
        QOut("Ja existe um produto com esse codigo.")
        Pausar()
        RETURN NIL
    ENDIF

    cNome := LerTextoObrigatorio("Nome do produto: ")

    nQuantidade := LerNumeroInteiro( ;
        "Quantidade inicial: ", ;
        0, ;
        999999 )

    nPreco := LerNumeroDecimal( ;
        "Preco unitario: R$ ", ;
        0.01, ;
        999999999.99 )

    AAdd(aProdutos, { ;
        Upper(AllTrim(cCodigo)), ;
        AllTrim(cNome), ;
        nQuantidade, ;
        nPreco ;
    })

    QOut("")
    QOut("Produto cadastrado com sucesso.")

    Pausar()

RETURN NIL


FUNCTION ListarProdutos(aProdutos)

    LOCAL nI

    CLS

    QOut("==========================================")
    QOut("          LISTA DE PRODUTOS")
    QOut("==========================================")
    QOut("")

    IF Len(aProdutos) == 0
        QOut("Nenhum produto cadastrado.")
        Pausar()
        RETURN NIL
    ENDIF

    FOR nI := 1 TO Len(aProdutos)

        QOut("------------------------------------------")
        QOut("Produto ", nI)
        QOut("Codigo..........: ", aProdutos[nI][1])
        QOut("Nome............: ", aProdutos[nI][2])
        QOut("Quantidade......: ", aProdutos[nI][3])
        QOut("Preco unitario..: R$ ", ;
            Transform(aProdutos[nI][4], "@E 999,999,999.99"))

    NEXT

    QOut("------------------------------------------")

    Pausar()

RETURN NIL


FUNCTION EntradaEstoque(aProdutos)

    LOCAL cCodigo
    LOCAL nPosicao
    LOCAL nQuantidade

    CLS

    QOut("==========================================")
    QOut("          ENTRADA DE ESTOQUE")
    QOut("==========================================")
    QOut("")

    IF Len(aProdutos) == 0
        QOut("Nenhum produto cadastrado.")
        Pausar()
        RETURN NIL
    ENDIF

    cCodigo := LerTextoObrigatorio("Codigo do produto: ")

    nPosicao := BuscarProduto(aProdutos, cCodigo)

    IF nPosicao == 0
        QOut("")
        QOut("Produto nao encontrado.")
        Pausar()
        RETURN NIL
    ENDIF

    QOut("")
    QOut("Produto..........: ", aProdutos[nPosicao][2])
    QOut("Estoque atual....: ", aProdutos[nPosicao][3])
    QOut("")

    nQuantidade := LerNumeroInteiro( ;
        "Quantidade de entrada: ", ;
        1, ;
        999999 )

    aProdutos[nPosicao][3] += nQuantidade

    QOut("")
    QOut("Entrada realizada com sucesso.")
    QOut("Novo estoque....: ", aProdutos[nPosicao][3])

    Pausar()

RETURN NIL


FUNCTION SaidaEstoque(aProdutos)

    LOCAL cCodigo
    LOCAL nPosicao
    LOCAL nQuantidade

    CLS

    QOut("==========================================")
    QOut("           SAIDA DE ESTOQUE")
    QOut("==========================================")
    QOut("")

    IF Len(aProdutos) == 0
        QOut("Nenhum produto cadastrado.")
        Pausar()
        RETURN NIL
    ENDIF

    cCodigo := LerTextoObrigatorio("Codigo do produto: ")

    nPosicao := BuscarProduto(aProdutos, cCodigo)

    IF nPosicao == 0
        QOut("")
        QOut("Produto nao encontrado.")
        Pausar()
        RETURN NIL
    ENDIF

    QOut("")
    QOut("Produto..........: ", aProdutos[nPosicao][2])
    QOut("Estoque atual....: ", aProdutos[nPosicao][3])
    QOut("")

    IF aProdutos[nPosicao][3] == 0
        QOut("O produto esta sem estoque.")
        Pausar()
        RETURN NIL
    ENDIF

    nQuantidade := LerNumeroInteiro( ;
        "Quantidade de saida: ", ;
        1, ;
        999999 )

    IF nQuantidade > aProdutos[nPosicao][3]
        QOut("")
        QOut("Estoque insuficiente.")
        QOut("Quantidade disponivel: ", aProdutos[nPosicao][3])
        Pausar()
        RETURN NIL
    ENDIF

    aProdutos[nPosicao][3] -= nQuantidade

    QOut("")
    QOut("Saida realizada com sucesso.")
    QOut("Novo estoque....: ", aProdutos[nPosicao][3])

    Pausar()

RETURN NIL


FUNCTION BuscarProduto(aProdutos, cCodigo)

    LOCAL nI
    LOCAL cCodigoBusca := Upper(AllTrim(cCodigo))

    FOR nI := 1 TO Len(aProdutos)

        IF Upper(AllTrim(aProdutos[nI][1])) == cCodigoBusca
            RETURN nI
        ENDIF

    NEXT

RETURN 0


FUNCTION ConsultarProduto(aProdutos)

    LOCAL cCodigo
    LOCAL nPosicao
    LOCAL nValorEstoque

    CLS

    QOut("==========================================")
    QOut("           CONSULTA DE PRODUTO")
    QOut("==========================================")
    QOut("")

    IF Len(aProdutos) == 0
        QOut("Nenhum produto cadastrado.")
        Pausar()
        RETURN NIL
    ENDIF

    cCodigo := LerTextoObrigatorio("Codigo do produto: ")

    nPosicao := BuscarProduto(aProdutos, cCodigo)

    IF nPosicao == 0
        QOut("")
        QOut("Produto nao encontrado.")
        Pausar()
        RETURN NIL
    ENDIF

    nValorEstoque := ;
        aProdutos[nPosicao][3] * aProdutos[nPosicao][4]

    QOut("")
    QOut("Produto encontrado:")
    QOut("------------------------------------------")
    QOut("Codigo..........: ", aProdutos[nPosicao][1])
    QOut("Nome............: ", aProdutos[nPosicao][2])
    QOut("Quantidade......: ", aProdutos[nPosicao][3])
    QOut("Preco unitario..: R$ ", ;
        Transform(aProdutos[nPosicao][4], "@E 999,999,999.99"))
    QOut("Valor em estoque: R$ ", ;
        Transform(nValorEstoque, "@E 999,999,999.99"))

    Pausar()

RETURN NIL


FUNCTION RelatorioEstoque(aProdutos)

    LOCAL nI
    LOCAL nValorProduto
    LOCAL nTotalGeral := 0

    CLS

    QOut("==========================================")
    QOut("        RELATORIO DE ESTOQUE")
    QOut("==========================================")
    QOut("")

    IF Len(aProdutos) == 0
        QOut("Nenhum produto cadastrado.")
        Pausar()
        RETURN NIL
    ENDIF

    FOR nI := 1 TO Len(aProdutos)

        nValorProduto := ;
            aProdutos[nI][3] * aProdutos[nI][4]

        nTotalGeral += nValorProduto

        QOut("------------------------------------------")
        QOut("Codigo..........: ", aProdutos[nI][1])
        QOut("Produto.........: ", aProdutos[nI][2])
        QOut("Quantidade......: ", aProdutos[nI][3])
        QOut("Preco unitario..: R$ ", ;
            Transform(aProdutos[nI][4], "@E 999,999,999.99"))
        QOut("Valor em estoque: R$ ", ;
            Transform(nValorProduto, "@E 999,999,999.99"))

    NEXT

    QOut("==========================================")
    QOut("TOTAL GERAL.....: R$ ", ;
        Transform(nTotalGeral, "@E 999,999,999.99"))
    QOut("==========================================")

    Pausar()

RETURN NIL


FUNCTION LerTextoObrigatorio(cMensagem)

    LOCAL cValor := ""

    DO WHILE Empty(AllTrim(cValor))

        ACCEPT cMensagem TO cValor

        cValor := AllTrim(cValor)

        IF Empty(cValor)
            QOut("O campo nao pode ficar vazio.")
        ENDIF

    ENDDO

RETURN cValor


FUNCTION LerNumeroInteiro(cMensagem, nMinimo, nMaximo)

    LOCAL cValor
    LOCAL nValor

    DO WHILE .T.

        ACCEPT cMensagem TO cValor

        cValor := AllTrim(cValor)

        IF Empty(cValor)
            QOut("Informe um valor.")
            LOOP
        ENDIF

        IF !EhNumeroInteiro(cValor)
            QOut("Informe apenas um numero inteiro valido.")
            LOOP
        ENDIF

        nValor := Val(cValor)

        IF nValor < nMinimo .OR. nValor > nMaximo
            QOut("Informe um valor entre ", ;
                nMinimo, " e ", nMaximo, ".")
            LOOP
        ENDIF

        EXIT

    ENDDO

RETURN nValor


FUNCTION LerNumeroDecimal(cMensagem, nMinimo, nMaximo)

    LOCAL cValor
    LOCAL nValor

    DO WHILE .T.

        ACCEPT cMensagem TO cValor

        cValor := AllTrim(cValor)
        cValor := StrTran(cValor, ",", ".")

        IF Empty(cValor)
            QOut("Informe um valor.")
            LOOP
        ENDIF

        IF !EhNumeroDecimal(cValor)
            QOut("Informe um numero valido.")
            LOOP
        ENDIF

        nValor := Val(cValor)

        IF nValor < nMinimo .OR. nValor > nMaximo
            QOut("Informe um valor entre ", ;
                nMinimo, " e ", nMaximo, ".")
            LOOP
        ENDIF

        EXIT

    ENDDO

RETURN nValor


FUNCTION EhNumeroInteiro(cValor)

    LOCAL nI
    LOCAL cCaractere

    IF Empty(cValor)
        RETURN .F.
    ENDIF

    FOR nI := 1 TO Len(cValor)

        cCaractere := SubStr(cValor, nI, 1)

        IF !cCaractere $ "0123456789"
            RETURN .F.
        ENDIF

    NEXT

RETURN .T.


FUNCTION EhNumeroDecimal(cValor)

    LOCAL nI
    LOCAL cCaractere
    LOCAL nPontos := 0

    IF Empty(cValor)
        RETURN .F.
    ENDIF

    FOR nI := 1 TO Len(cValor)

        cCaractere := SubStr(cValor, nI, 1)

        IF cCaractere == "."
            nPontos++

            IF nPontos > 1
                RETURN .F.
            ENDIF

        ELSEIF !cCaractere $ "0123456789"
            RETURN .F.
        ENDIF

    NEXT

    IF cValor == "."
        RETURN .F.
    ENDIF

RETURN .T.


FUNCTION Pausar()

    LOCAL cTecla

    QOut("")
    ACCEPT "Pressione ENTER para continuar..." TO cTecla

RETURN NIL