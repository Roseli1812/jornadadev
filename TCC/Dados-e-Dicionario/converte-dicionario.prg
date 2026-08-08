REQUEST DBFCDX


PROCEDURE Main()

    LOCAL aArquivos := {}
    LOCAL nI
    LOCAL lSucesso

    RddSetDefault("DBFCDX")

    CLS

    ? "=============================================="
    ? " CONVERSOR DICIONARIO PROTHEUS DBF -> CSV"
    ? "=============================================="
    ?

    /*
     * Arquivos do dicionario
     *
     * Origem       Destino
     */
AAdd(aArquivos, { "sx2990.dbf", "csv\sx2.csv" })
AAdd(aArquivos, { "sx3990.dbf", "csv\sx3.csv" })
AAdd(aArquivos, { "six990.dbf", "csv\six.csv" })
AAdd(aArquivos, { "sxb990.dbf", "csv\sxb.csv" })
AAdd(aArquivos, { "zz1990.dbf", "csv\zz1.csv" })
AAdd(aArquivos, { "zz2990.dbf", "csv\zz2.csv" })
AAdd(aArquivos, { "sb1990.dbf", "csv\sb1.csv" })
AAdd(aArquivos, { "sx7990.dbf", "csv\sx7.csv" })

    /*
     * Tenta criar pasta CSV.
     * Se ela ja existir, seguimos normalmente.
     */
    hb_DirCreate("csv")

    /*
     * Processamento
     */
    FOR nI := 1 TO Len(aArquivos)

        ?
        ? "----------------------------------------------"
        ? "Processando:", aArquivos[nI][1]

        lSucesso := ConverterDBF( ;
            aArquivos[nI][1], ;
            aArquivos[nI][2] ;
        )

        IF lSucesso
            ? "OK:", aArquivos[nI][2]
        ELSE
            ? "ERRO:", aArquivos[nI][1]
        ENDIF

    NEXT

    ?
    ? "=============================================="
    ? " PROCESSAMENTO FINALIZADO"
    ? "=============================================="
    ?
    ? "Arquivos gerados na pasta CSV."
    ?

    WAIT

RETURN


/*
 * ========================================================
 * CONVERTER DBF PARA CSV
 * ========================================================
 */

FUNCTION ConverterDBF(cDbf, cCsv)

    LOCAL nHandle
    LOCAL aEstrutura
    LOCAL nCampos
    LOCAL nCampo
    LOCAL cLinha
    LOCAL uValor
    LOCAL nRegistros := 0

    /*
     * Verifica se DBF existe
     */
    IF ! File(cDbf)

        ? "Arquivo nao encontrado:", cDbf

        RETURN .F.

    ENDIF


    /*
     * Fecha alias caso esteja aberto
     */
    IF Select("DADOS") > 0
        DADOS->(DbCloseArea())
    ENDIF


    /*
     * Abre DBF
     */
    USE (cDbf) NEW SHARED ALIAS DADOS

    IF NetErr()

        ? "Nao foi possivel abrir:", cDbf

        RETURN .F.

    ENDIF


    /*
     * Le estrutura
     */
    aEstrutura := DADOS->(DbStruct())

    nCampos := Len(aEstrutura)

    ? "Registros:", DADOS->(LastRec())
    ? "Campos   :", nCampos


    /*
     * Cria CSV
     */
    nHandle := FCreate(cCsv)

    IF nHandle < 0

        ? "Nao foi possivel criar:", cCsv

        DADOS->(DbCloseArea())

        RETURN .F.

    ENDIF


    /*
     * Monta cabecalho
     */
    cLinha := ""

    FOR nCampo := 1 TO nCampos

        IF nCampo > 1
            cLinha += ";"
        ENDIF

        cLinha += aEstrutura[nCampo][1]

    NEXT

    GravarLinha(nHandle, cLinha)


    /*
     * Percorre registros
     */
    DADOS->(DbGoTop())

    DO WHILE ! DADOS->(Eof())

        cLinha := ""

        FOR nCampo := 1 TO nCampos

            IF nCampo > 1
                cLinha += ";"
            ENDIF

            uValor := DADOS->(FieldGet(nCampo))

            cLinha += ValorCSV(uValor)

        NEXT

        GravarLinha(nHandle, cLinha)

        nRegistros++

        DADOS->(DbSkip())

    ENDDO


    /*
     * Fecha CSV
     */
    FClose(nHandle)


    /*
     * Fecha DBF
     */
    DADOS->(DbCloseArea())


    ? "Exportados:", nRegistros

RETURN .T.



/*
 * ========================================================
 * CONVERSAO DOS VALORES PARA TEXTO
 * ========================================================
 */

FUNCTION ValorCSV(uValor)

    LOCAL cValor := ""

    DO CASE

    /*
     * Caracter
     */
    CASE ValType(uValor) == "C"

        cValor := AllTrim(uValor)


    /*
     * Numerico
     */
    CASE ValType(uValor) == "N"

        cValor := AllTrim(Str(uValor))


    /*
     * Data
     */
    CASE ValType(uValor) == "D"

        IF Empty(uValor)

            cValor := ""

        ELSE

            cValor := DToS(uValor)

        ENDIF


    /*
     * Logico
     */
    CASE ValType(uValor) == "L"

        IF uValor
            cValor := "T"
        ELSE
            cValor := "F"
        ENDIF


    /*
     * Outros tipos
     */
    OTHERWISE

        cValor := ""

    ENDCASE


    /*
     * Remove quebras de linha
     */
    cValor := StrTran(cValor, Chr(13), " ")
    cValor := StrTran(cValor, Chr(10), " ")


    /*
     * Protege aspas
     */
    cValor := StrTran(cValor, '"', '""')


    /*
     * Coloca o valor entre aspas
     *
     * Isso permite preservar ponto e virgula
     * existente no conteudo dos campos.
     */
    cValor := '"' + cValor + '"'

RETURN cValor



/*
 * ========================================================
 * GRAVACAO DE LINHA
 * ========================================================
 */

FUNCTION GravarLinha(nHandle, cLinha)

    FWrite( ;
        nHandle, ;
        cLinha + Chr(13) + Chr(10) ;
    )

RETURN NIL
