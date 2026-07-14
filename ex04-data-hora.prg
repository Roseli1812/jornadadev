 // fun‡Æo para exibir a data e hora atual do sistema

    FUNCTION Main()

    LOCAL cNome  := "  Roseli" 
    LOCAL cCidade:= "Indaiatuba" 
    LOCAL cCurso := " Harbou/ADVPL"  
    LOCAL cData  := DToC(Date()) 
    LOCAL cHora:= Time() 

    hb_cdpSelect("PT850")//dica do Pedro

    QOut("=========================")  
    qOut("Ficha de apresenta‡Æo    ")  
    QOut("=========================") 
    QOut("Nome: " + cNome + "!")  
    QOut("Cidade: " + cCidade + "!")  
    QOut("Curso: " + cCurso + "!")  
    QOut("Data: " + cData + "!")  
    QOut("Hora: " + cHora + "!")  

    RETURN NIL