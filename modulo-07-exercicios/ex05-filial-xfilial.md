a. Por que existe o campo A1_FILIAL na tabela SA1 (e por que toda tabela do Protheus, incluindo a ZA1, precisa de um campo de filial)?

O campo A1_FILIAL identifica a qual filial pertence cada registro da tabela SA1 (Cadastro de Clientes). Da mesma forma, a tabela ZA1 utiliza  para identificar a filial de cada cadastro.
Esse campo Ç necess†rio porque o Protheus Ç um ERP preparado para ambientes com m£ltiplas filiais. Assim, uma mesma empresa pode possuir diversas unidades compartilhando o mesmo banco de dados, mas mantendo seus registros organizados por filial.

=============================================================================================================================================

b. O que a funá∆o xFilial() tem a ver com isso? O que aconteceria se um programa "escrevesse a filial na m∆o" em vez de usar xFilial()?

A funá∆o xFilial() retorna a filial correta para uma determinada tabela, considerando a configuraá∆o do ambiente do Protheus.

Se o desenvolvedor escrever a filial "na m∆o", diversos problemas podem ocorrer:

O programa funcionar† apenas na filial informada (por exemplo, "01").
Ao executar em outra filial, os registros poder∆o ser gravados na filial errada.
Consultas poder∆o deixar de localizar registros porque a filial gravada n∆o corresponde Ö filial corrente.
Em ambientes com compartilhamento de tabelas ou configuraá‰es espec°ficas de filiais, a rotina poder† apresentar comportamentos incorretos.

Portanto, utilizar xFilial() Ç uma boa pr†tica de desenvolvimento em ADVPL, pois garante que o sistema sempre utilize a filial correta de acordo com a configuraá∆o do ambiente, tornando o c¢digo reutiliz†vel, mais seguro e compat°vel com instalaá‰es que possuam uma ou v†rias filiais.