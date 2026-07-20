FUNCTION Main()

    LOCAL nSalario := 0.00
    LOCAL nReajuste := 0.00
    LOCAL nNovoSalario := 0.00

    // Entrada do sal rio
    ACCEPT "Digite o sal rio atual: " TO nSalario

     nSalario := Val(nSalario) // funcao Val() converte a string para n£mero

    // Define o percentual de reajuste
    IF nSalario < 1000

        nReajuste := 0.15

    ELSEIF nSalario <= 2000

        nReajuste := 0.12

    ELSEIF nSalario <= 4000

        nReajuste := 0.08

    ELSE

        nReajuste := 0.05

    ENDIF

    // Calcula o novo sal rio
    nNovoSalario := nSalario + ( nSalario * nReajuste )

    // Exibe os resultados
    QOut( "Sal rio atual : R$ ", + Str(nSalario, 8, 2))
    QOut( "Reajuste      : ", nReajuste * 100, "%" )
    QOut( "Novo sal rio  : R$ ", + Str(nNovoSalario, 8, 2))

RETURN NIL