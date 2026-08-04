a. Qual a diferen‡a entre campo, contra-dom¡nio e regra num gatilho?

 Em um gatilho, o campo ‚ o que inicia a a‡Æo quando o usu rio informa ou altera um valor. O contra-dom¡nio ‚ o campo que vai receber o resultado. J  a regra ‚ a expressÆo usada para calcular ou buscar esse resultado.

Por exemplo:

* Campo: A1_CEP
* Contra-dom¡nio: A1_MUN
* Regra: buscar o munic¡pio correspondente ao CEP

Assim, quando o usu rio digita o CEP, o gatilho pode preencher automaticamente o munic¡pio.

=============================================================================================================================================

b. Por que a regra usa M->A1_CEP e nÆo SA1->A1_CEP ?

 A regra usa M->A1_CEP porque o valor digitado pelo usu rio ainda est  na mem¢ria da tela.

O comando:

M->A1_CEP -> pega o valor atual que est  sendo digitado.

J :

SA1->A1_CEP -> pega o valor que j  est  gravado na tabela SA1.

Durante uma inclusÆo, o cliente ainda nÆo foi gravado. Durante uma altera‡Æo, a tabela pode ainda ter o CEP antigo. Por isso, no gatilho, usamos M->A1_CEP.

==============================================================================================================================================

c. Os CEPs estÆo dentro do fonte. Cite dois problemas disso em produ‡Æo e como vocˆ resolveria (pense em tabela do dicion rio e em servi‡o externo).

 Colocar os CEPs diretamente dentro do fonte pode causar alguns problemas.
O primeiro problema ‚ a manuten‡Æo. Sempre que for necess rio incluir ou corrigir um CEP, ser  preciso alterar o fonte, compilar novamente e atualizar o sistema.O segundo problema ‚ que o fonte pode ficar muito grande e dif¡cil de entender, porque existem muitos CEPs.

Uma solu‡Æo seria criar uma tabela pr¢pria no dicion rio, por exemplo a tabela `ZCE`, com campos como:

ZCE_FILIAL
ZCE_CEP
ZCE_MUN
ZCE_EST
ZCE_CODMUN

Assim, o programa buscaria os dados nessa tabela, sem precisar deixar todos os CEPs escritos no fonte.

Outra solu‡Æo seria consultar um servi‡o externo de CEP. Esse servi‡o poderia retornar o endere‡o, bairro, munic¡pio e estado. Mesmo usando um servi‡o externo, seria interessante guardar os dados em uma tabela local, caso o servi‡o fique fora do ar.

=============================================================================================================================================

d. Se pedissem para preencher tamb‚m o c¢digo do munic¡pio ( A1_COD_MUN ), o que vocˆ faria?

 Para preencher tamb‚m o campo A1_COD_MUN, eu criaria outro contra-dom¡nio no gatilho do CEP.

O funcionamento seria parecido com o preenchimento do munic¡pio. Depois que o usu rio informasse o CEP, o sistema buscaria tamb‚m o c¢digo do munic¡pio.
Esse c¢digo poderia ser buscado em uma tabela pr¢pria de CEPs ou em uma tabela padrÆo do Protheus que tenha os c¢digos dos munic¡pios.
Eu tamb‚m verificaria o estado junto com o munic¡pio, para evitar buscar um munic¡pio errado.
Antes de fazer a busca, tamb‚m seria importante retirar o h¡fen do CEP. Por exemplo:

cCEP := StrTran(M->A1_CEP, "-", "")
Assim, o sistema conseguiria pesquisar o CEP mesmo que o usu rio digitasse no formato 13330-100.
