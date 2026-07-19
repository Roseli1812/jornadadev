
function Main()

    local nNome := "Roseli"
    local nSalarioBruto := 10000.00
    local lAtivo := .T.
    local dDataAdmissao := "2026/06/13"
    local nCodigoDepartamento := " TI "

hb_cdpSelect("PT850")

QOut (  "Nome" + " "+ nNome)
QOut ( "Salario" + str(nSalarioBruto, 10, 2))    
QOut("Ativo:", IIf(lAtivo, "Sim", "N∆o"))
QOut("Data de Admiss∆o:", + (dDataAdmissao))
QOut ( "C¢digo do Departamento" + (nCodigoDepartamento))


RETURN NIL