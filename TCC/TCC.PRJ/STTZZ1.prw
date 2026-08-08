#Include "Protheus.ch"

User Function STTZZ1()

    Private cCadastro
    Private aRotina
    Private aCores

    cCadastro := "Controle de Fornecimento"
    aRotina    := {}
    aCores     := {}

    AAdd(aRotina, {"Pesquisar"  , "AxPesqui"     , 0, 1})
    AAdd(aRotina, {"Visualizar" , "AxVisual"     , 0, 2})
    AAdd(aRotina, {"Incluir"    , "AxInclui"     , 0, 3})
    AAdd(aRotina, {"Alterar"    , "AxAltera"     , 0, 4})
    AAdd(aRotina, {"Excluir"    , "AxDeleta"     , 0, 5})
    AAdd(aRotina, {"Ocorrencias", "U_STTZZ1OC()" , 0, 6})

    AAdd(aCores, {;
        "!Empty(ZZ1->ZZ1_VALCER) .AND. ZZ1->ZZ1_VALCER < dDataBase",;
        "BR_VERMELHO";
    })

    AAdd(aCores, {;
        "!Empty(ZZ1->ZZ1_VALCER) .AND. ZZ1->ZZ1_VALCER >= dDataBase .AND. ZZ1->ZZ1_VALCER <= dDataBase + 30",;
        "BR_AMARELO";
    })

    AAdd(aCores, {".T.", "BR_VERDE"})

    DbSelectArea("ZZ1")
    DbSetOrder(1)
    DbGoTop()

    mBrowse(6, 1, 22, 75, "ZZ1",,,,,,aCores)

Return Nil


User Function STTZZ1OC()

    Local cCodigo

    cCodigo := ""

    DbSelectArea("ZZ1")

    If ZZ1->(Eof())
        MsgAlert("Selecione um registro.", "Atencao")
        Return Nil
    EndIf

    cCodigo := AllTrim(ZZ1->ZZ1_CODIGO)

    If Empty(cCodigo)
        MsgAlert("Codigo nao informado.", "Atencao")
        Return Nil
    EndIf

    U_STTZZ2FLT(cCodigo)

Return Nil

User Function  STTZZ2FLT(cCodigo)
  

    Local cFiltro

    Private cCadastro
    Private aRotina
    Private aCores

    cCadastro := "Ocorrencias de Fornecedor"
    aRotina    := {}
    aCores     := {}
    cFiltro    := ""

    If Empty(cCodigo)
        MsgAlert("Codigo nao informado.", "Atencao")
        Return Nil
    EndIf

    AAdd(aRotina, {"Pesquisar" , "AxPesqui", 0, 1})
    AAdd(aRotina, {"Visualizar", "AxVisual", 0, 2})
    AAdd(aRotina, {"Incluir"   , "AxInclui", 0, 3})
    AAdd(aRotina, {"Alterar"   , "AxAltera", 0, 4})
    AAdd(aRotina, {"Excluir"   , "AxDeleta", 0, 5})

    DbSelectArea("ZZ2")
    DbSetOrder(1)

    cFiltro := "ZZ2->ZZ2_CONFOR == '" + cCodigo + "'"

    DbSetFilter(;
        {|| AllTrim(ZZ2->ZZ2_CONFOR) == AllTrim(cCodigo)},;
        cFiltro;
    )

    DbGoTop()

    mBrowse(6, 1, 22, 75, "ZZ2")

    DbClearFilter()

Return Nil      
      
User Function  STTZZVLD(cCampo)

Local lRet := .T.        
	
	
	IF cCampo = "ZZ1_VALCER"
  		IF M->ZZ1_VALCER < dDataBase                   
	 		 MsgAlert("Validade do certificado não pode ser inferior à data atual ", "Atencao")                                                                                                              
 	  		 lRet := .F.
  		Endif  		 
  	
  	Elseif cCampo = "ZZ1_TOLERA"
	
	
		IF M->ZZ1_TOLERA < 0 .OR. M->ZZ1_TOLERA> 100               
	 		 MsgAlert(" O valor deve estar entre 0 e 100 ", "Atencao")                                                                                                              
 	  		 lRet := .F.
		Endif 
	   
  	Elseif cCampo = "ZZ2_DATA"
	
		IF M->ZZ2_DATA > dDataBase                   
	 		 MsgAlert("não pode ser data futura", "Atencao")                                                                                                              
 	  	 	lRet := .F.
		Endif
	Endif 
	
Return lRet