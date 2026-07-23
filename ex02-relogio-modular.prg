FUNCTION Main()

    LOCAL cHora
    LOCAL dInicio := Seconds()

    hb_cdpSelect("PT850")

    DO WHILE ( Seconds() - dInicio ) < 30

        CLS

        cHora := ObterHora()
        cHora := FormatarHora(cHora)
        ExibirHora(cHora)

        Inkey(1)   // Aguarda aproximadamente 1 segundo

    ENDDO

RETURN NIL


//==================================================
// Retorna a hora atual
//==================================================
FUNCTION ObterHora()

RETURN Time()


//==================================================
// Formata a hora no padrÆo HH:MM:SS
//==================================================
FUNCTION FormatarHora(cHora)

RETURN Left(cHora,8)


//==================================================
// Exibe a hora na tela
//==================================================
FUNCTION ExibirHora(cHora)

    QOut("=================================")
    QOut("      RELàGIO DIGITAL")
    QOut("=================================")
    QOut("")
    QOut("Hora Atual: " + cHora)

RETURN NIL