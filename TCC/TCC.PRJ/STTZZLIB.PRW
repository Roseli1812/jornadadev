#Include "Protheus.ch"

/*/{Protheus.doc} STTNFOR
Retorna o nome do fornecedor
/*/
User Function STTNFOR(cFornec, cLoja)

    Local cNome := ""

    If !Empty(cFornec)

        cNome := Posicione(;
            "SA2",;
            1,;
            xFilial("SA2") + cFornec + cLoja,;
            "A2_NOME";
        )

    EndIf

Return cNome


/*/{Protheus.doc} STTNPRO
Retorna a descricao do produto
/*/
User Function STTNPRO(cCodPro)

    Local cDescricao := ""

    If !Empty(cCodPro)

        cDescricao := Posicione(;
            "SB1",;
            1,;
            xFilial("SB1") + cCodPro,;
            "B1_DESC";
        )

    EndIf

Return cDescricao


/*/{Protheus.doc} STTPNC
Calcula o percentual nao conforme
/*/
User Function STTPNC(nOk, nNok)

    Local nTotal      := 0
    Local nPercentual := 0

    nTotal := nOk + nNok

    // Evita divisao por zero
    If nTotal > 0

        nPercentual := (nNok / nTotal) * 100

    EndIf

Return nPercentual


/*/{Protheus.doc} STTCV30
Retorna verdadeiro se o certificado
vence entre hoje e os proximos 30 dias
/*/
User Function STTCV30(dValCer)

    Local lVencendo := .F.

    If !Empty(dValCer)

        If dValCer >= dDataBase .AND. ;
           dValCer <= dDataBase + 30

            lVencendo := .T.

        EndIf

    EndIf

Return lVencendo


/*/{Protheus.doc} STTLOG
Grava um arquivo de log simples
/*/
User Function STTLOG(cFuncao, oErro)

    Local cArquivo  := ""
    Local cMensagem := ""
    Local nArquivo  := 0

    cArquivo := GetTempPath() + "STTZZ_LOG.TXT"

    cMensagem := DToC(dDataBase) + " " + Time() +;
                 " - Funcao: " + cFuncao

    If ValType(oErro) == "O"

        cMensagem += " - Erro: " + oErro:Description

    Else

        cMensagem += " - Erro nao informado"

    EndIf

    cMensagem += CRLF

    // Abre o arquivo para escrita
    nArquivo := FOpen(cArquivo, 2)

    // Se nao existir, cria o arquivo
    If nArquivo < 0

        nArquivo := FCreate(cArquivo)

    Else

        // Posiciona no final do arquivo
        FSeek(nArquivo, 0, 2)

    EndIf

    If nArquivo >= 0

        FWrite(nArquivo, cMensagem)
        FClose(nArquivo)

    EndIf

Return Nil