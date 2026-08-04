a. Liste os campos da ZA1 (nome do campo, tipo, tamanho) ? incluindo o campo de filial,
que Ç obrigat¢rio em toda tabela do Protheus.


| Descriá∆o       | Campo      | Tipo | Tamanho |
| --------------- | ---------- | ---- | ------- |
| Filial          | ZA1_FILIAL | C    | 2       |
| C¢digo          | ZA1_COD    | C    | 6       |
| Cliente (dono)  | ZA1_CLIENT | C    | 6       |
| Loja do cliente | ZA1_LOJA   | C    | 2       |
| Nome do cliente | ZA1_NOMCLI | C    | 40      |
| Nome do pet     | ZA1_NOME   | C    | 30      |
| Raáa            | ZA1_RACA   | C    | 20      |
| Nascimento      | ZA1_DTNASC | D    | 8       |
| Observaá∆o      | ZA1_OBS    | C    | 60      |

===========================================================================================
b. Que °ndice faria sentido para a ZA1? Justifique (lembre da analogia da lista telefìnica).

ZA1_FILIAL + ZA1_COD

Esse °ndice faz sentido porque o campo ZA1_COD identifica o cadastro do pet e a filial delimita em qual unidade aquele c¢digo existe.

============================================================================================
c. Explique por que o prefixo da tabela Ç Z (o que esse prefixo significa em termos de
convená∆o do Protheus).

No Protheus, o prefixo Z Ç utilizado por convená∆o para identificar tabelas customizadas, (tabelas criadas pelo cliente) e que n∆o pertencem originalmente ao produto padr∆o da TOTVS.

======================================================================================================
d. Explique por que os campos comeáam com ZA1_ (ex: ZA1_NOME , ZA1_RACA ) e n∆o
apenas com o nome do campo solto.

Os campos comeáam com ZA1_ porque o Protheus utiliza uma convená∆o em que o nome do campo carrega o nome da tabela Ö qual ele pertence.