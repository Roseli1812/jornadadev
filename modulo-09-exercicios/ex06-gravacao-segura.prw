#Include "Protheus.ch"

User Function STTIP003SALVAR()

    Local cCliente := ""
    Local cAssunto := "Primeiro Contato"
    Local cCodigo  := ""
    Local oErro    := ""

    BEGIN TRANSACTION

        BEGIN SEQUENCE

            // Valida o cliente
            If Empty(AllTrim(cCliente))
                Break("Cliente obrigatorio.")
            EndIf

            // Valida o assunto
            If Empty(AllTrim(cAssunto))
                Break("Assunto obrigatorio.")
            EndIf

            DbSelectArea("SZ1")
            DbSetOrder(1)

            cCodigo := StrZero(RecCount() + 1, 6)

            RecLock("SZ1", .T.)

            SZ1->Z1_FILIAL  := xFilial("SZ1")
            SZ1->Z1_CODIGO  := cCodigo
            SZ1->Z1_CLIENTE := cCliente
            SZ1->Z1_ASSUNTO := cAssunto
            SZ1->Z1_DATA    := Date()

            MsUnLock()

            MsgInfo("Contato gravado com sucesso!")

        RECOVER USING oErro

            // Cancela a transacao
            DisarmTransaction()

            MsgStop(;
                "Nao foi possivel salvar o contato." + CRLF + ;
                oErro,;
                "Erro";
            )

            U_GRAVARLOG("STTIP003SALVAR", oErro)

        END SEQUENCE

    END TRANSACTION

Return .T.