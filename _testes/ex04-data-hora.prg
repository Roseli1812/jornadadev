// fun‡Æo para exibir a data e hora atual do sistema
FUNCTION Main()

    LOCAL cData  := DToC(Date()) 
    LOCAL cHora:= Time() 
    
 
    QOut("cData: " + cData + "!")  
    QOut("cHora: " + cHora + "!")  

    RETURN NIL