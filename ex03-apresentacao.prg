FUNCTION Main()

    LOCAL cNome  := "  Roseli" // declara a variavel
    LOCAL cCidade:= "Indaiatuba" // declara a variavel
    LOCAL cCurso := " Harbou/ADVPL"  // declara a variavel

    hb_cdpSelect("PT850")//dica do Pedro

    QOut("=========================")  // exibe a variavel
    qOut("Ficha de apresenta‡Æo    ")  // exibe a variavel
    QOut("=========================")  // exibe a variavel
    QOut("Nome: " + cNome + "!")  // exibe a variavel
    QOut("Cidade: " + cCidade + "!")  // exibe a variavel
    QOut("Curso: " + cCurso + "!")  // exibe a variavel

    RETURN NIL