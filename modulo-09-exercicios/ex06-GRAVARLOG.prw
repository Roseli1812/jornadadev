#include "protheus.ch"

/*/{Protheus.doc} GRAVARLOG
    Registra erros da aplicação
/*/

User Function GRAVARLOG(cFuncao, oErro)

    Local cMensagem := ""

    cMensagem += "=============================="
    cMensagem += CRLF
    cMensagem += "FUNCAO : " + cFuncao
    cMensagem += CRLF
    cMensagem += "DATA   : " + DTOC(Date())
    cMensagem += CRLF
    cMensagem += "HORA   : " + Time()
    cMensagem += CRLF

    If ValType(oErro) == "O"
        cMensagem += "ERRO   : " + oErro:Description
    Else
        cMensagem += "ERRO   : Erro desconhecido"
    EndIf

    ConOut(cMensagem)

Return