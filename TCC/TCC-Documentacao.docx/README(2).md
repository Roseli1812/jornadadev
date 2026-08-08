# Controle de Fornecimento e Não Conformidades

> **TOTVS Protheus • SIGACOM • ADVPL**  
> TCC — Harbour/ADVPL — Do Zero ao Protheus  
> **Versão:** 1.0  
> **Data de entrega:** 07/08/2026

## 1. Objetivo do Projeto

O projeto implementa no módulo de Compras (**SIGACOM**) do TOTVS Protheus um controle de certificados de qualidade de fornecedores e de ocorrências de não conformidade na entrada de materiais. O objetivo funcional é apoiar o acompanhamento de fornecedores no contexto do processo de certificação **ISO 9001**.

A solução utiliza duas tabelas customizadas: **ZZ1** para o controle de fornecimento e certificados, e **ZZ2** para registrar as ocorrências relacionadas. As tabelas se integram aos cadastros padrão **SA2 (Fornecedores)** e **SB1 (Produtos)**.

## 2. Escopo Funcional

- Cadastrar e manter controles de fornecimento por fornecedor.
- Registrar dados e validade do certificado de qualidade.
- Definir percentual de tolerância de não conformidade.
- Registrar ocorrências de fornecedor vinculadas ao controle ZZ1.
- Relacionar as ocorrências a produtos do cadastro SB1.
- Calcular quantidades e valores conformes e não conformes.
- Disponibilizar rotinas `mBrowse` para ZZ1 e ZZ2.
- Apresentar legendas visuais para validade do certificado e nível de não conformidade.
- Disponibilizar acesso às rotinas pelo menu do SIGACOM.

## 3. Arquitetura e Integrações

| Componente | Finalidade |
|---|---|
| ZZ1 | Controle de fornecimento, certificado, validade, tolerância e totais. |
| ZZ2 | Ocorrências de não conformidade vinculadas ao controle ZZ1. |
| SA2 | Cadastro padrão utilizado para validar e obter dados do fornecedor. |
| SB1 | Cadastro padrão utilizado para validar e obter dados do produto. |
| SX3 | Definição dos campos, validações, formatos e campos virtuais. |
| SX7 | Gatilhos para preenchimentos automáticos. |
| SXB | Consultas padrão para controle, fornecedor e produto. |
| SIGACOM | Módulo em que as rotinas são disponibilizadas. |

## 4. Dicionário de Dados

### 4.1 Tabela ZZ1 — Controle de Fornecimento

**Acesso:** Compartilhado.

| Título | Campo | Tipo | Tam. | Dec. | Contexto |
|---|---|---:|---:|---:|---|
| Filial | ZZ1_FILIAL | C | 2 | 0 | Real |
| Código | ZZ1_CODIGO | C | 6 | 0 | Real |
| Cód. Fornecedor | ZZ1_FORNEC | C | 6 | 0 | Real |
| Loja Fornecedor | ZZ1_LOJAFO | C | 2 | 0 | Real |
| Nome Fornecedor | ZZ1_NOMEFO | C | 40 | 0 | Virtual |
| Dados Certificado | ZZ1_CERTIF | C | 256 | 0 | Real |
| Val. Certificado | ZZ1_VALCER | D | 8 | 0 | Real |
| Tolerância (%) | ZZ1_TOLERA | N | 5 | 2 | Real |
| Qtd. Conforme | ZZ1_TOTOK | N | 12 | 2 | Real |
| Qtd. Não Conforme | ZZ1_TOTNOK | N | 12 | 2 | Real |

#### Índices ZZ1

| Ordem | Expressão | Descrição |
|---:|---|---|
| 1 | `ZZ1_FILIAL + ZZ1_CODIGO` | Chave primária |
| 2 | `ZZ1_FILIAL + ZZ1_FORNEC + ZZ1_LOJAFO` | Por fornecedor |
| 3 | `ZZ1_FILIAL + DTOS(ZZ1_VALCER)` | Por validade do certificado |

### 4.2 Tabela ZZ2 — Ocorrências do Fornecedor

**Acesso:** Compartilhado.

| Título | Campo | Tipo | Tam. | Dec. | Contexto |
|---|---|---:|---:|---:|---|
| Filial | ZZ2_FILIAL | C | 2 | 0 | Real |
| Controle (→ZZ1) | ZZ2_CONFOR | C | 6 | 0 | Real |
| Cód. Fornecedor | ZZ2_FORNEC | C | 6 | 0 | Real |
| Loja Fornecedor | ZZ2_LOJAFO | C | 2 | 0 | Real |
| Nome Fornecedor | ZZ2_NOMEFO | C | 40 | 0 | Virtual |
| Data Ocorrência | ZZ2_DATA | D | 8 | 0 | Real |
| Hora | ZZ2_HORA | C | 5 | 0 | Real |
| Produto | ZZ2_CODPRO | C | 15 | 0 | Real |
| Qtde. Conforme | ZZ2_QTDOK | N | 12 | 0 | Real |
| Qtde. Não Conforme | ZZ2_QTDNOK | N | 12 | 0 | Real |
| Valor Unitário | ZZ2_VLRUNI | N | 12 | 2 | Real |
| R$ Conforme | ZZ2_TOTOK | N | 12 | 2 | Virtual |
| R$ Não Conforme | ZZ2_TOTNOK | N | 12 | 2 | Virtual |

#### Índices ZZ2

| Ordem | Expressão | Descrição |
|---:|---|---|
| 1 | `ZZ2_FILIAL + ZZ2_CONFOR + DTOS(ZZ2_DATA) + ZZ2_HORA` | Chave primária |
| 2 | `ZZ2_FILIAL + ZZ2_FORNEC + ZZ2_LOJAFO + DTOS(ZZ2_DATA)` | Por fornecedor e data |
| 3 | `ZZ2_FILIAL + DTOS(ZZ2_DATA)` | Por data |

## 5. Campos Virtuais e Regras de Cálculo

**Nome do fornecedor na ZZ1:**

```advpl
POSICIONE("SA2",1,xFilial("SA2")+M->ZZ1_FORNEC+M->ZZ1_LOJAFO,"A2_NOME")
```

**Nome do fornecedor na ZZ2:**

```advpl
POSICIONE("SA2",1,xFilial("SA2")+M->ZZ2_FORNEC+M->ZZ2_LOJAFO,"A2_NOME")
```

**Valores monetários das ocorrências:**

```advpl
ZZ2_TOTOK  = M->ZZ2_QTDOK  * M->ZZ2_VLRUNI
ZZ2_TOTNOK = M->ZZ2_QTDNOK * M->ZZ2_VLRUNI
```

Para campos numéricos, o formato (`X3_PICTURE`) deve ser configurado de acordo com o tamanho e as casas decimais. Como referência:

```text
@E 999,999,999.99
```

## 6. Validações de Dados

| Campo | Regra funcional |
|---|---|
| ZZ1_FORNEC | Fornecedor informado deve existir na SA2. |
| ZZ1_VALCER | Na inclusão, a validade do certificado não pode ser inferior à data-base. |
| ZZ1_TOLERA | Percentual deve permanecer entre 0 e 100. |
| ZZ2_CONFOR | Controle informado deve existir na ZZ1. |
| ZZ2_CODPRO | Produto informado deve existir na SB1. |
| ZZ2_DATA | Data da ocorrência não pode ser futura. |

> **Observação:** em ambientes legados, a composição da chave utilizada por `ExistCpo()` deve ser validada conforme o comportamento do ambiente e os índices configurados. O critério funcional permanece a existência do registro relacionado.

## 7. Gatilhos SX7

### 7.1 Gatilhos da ZZ1

| Origem | Destino | Objetivo | Fase |
|---|---|---|---:|
| ZZ1_FORNEC | ZZ1_NOMEFO | Obter `A2_NOME` do fornecedor informado. | 3 |

### 7.2 Gatilhos da ZZ2

| Origem | Destino | Objetivo | Fase |
|---|---|---|---:|
| ZZ2_CONFOR | ZZ2_FORNEC | Copiar fornecedor do controle ZZ1. | 3 |
| ZZ2_CONFOR | ZZ2_LOJAFO | Copiar loja do controle ZZ1. | 3 |
| ZZ2_CONFOR | ZZ2_NOMEFO | Preencher nome do fornecedor. | 3 |
| ZZ2_DATA | ZZ2_DATA | Na inclusão, sugerir `dDataBase`. | 3 |
| ZZ2_HORA | ZZ2_HORA | Na inclusão, sugerir `Time()`. | 3 |

## 8. Rotinas ADVPL

### 8.1 STTZZ1.PRW

Rotina principal de manutenção da tabela ZZ1 utilizando `mBrowse`. Disponibiliza operações de pesquisa, visualização, inclusão, alteração e exclusão, além da opção **Ocorrências**.

Legenda prevista para a validade do certificado:

- 🔴 **Vermelho:** `ZZ1_VALCER < dDataBase` — certificado vencido.
- 🟡 **Amarelo:** certificado válido com vencimento em até 30 dias.
- 🟢 **Verde:** demais situações — certificado considerado OK.

O botão **Ocorrências** deve abrir a rotina da ZZ2 filtrando os registros pelo código do controle selecionado na ZZ1.

### 8.2 STTZZ2.PRW

Rotina `mBrowse` para manutenção das ocorrências de fornecedor. A legenda compara o percentual de não conformidade da ocorrência com a tolerância cadastrada na ZZ1.

```text
% NC = (ZZ2_QTDNOK / (ZZ2_QTDOK + ZZ2_QTDNOK)) * 100
```

- 🔴 Vermelho: percentual acima da tolerância.
- 🟢 Verde: ocorrência dentro da tolerância.

A versão filtrada deve exibir apenas registros em que `ZZ2_CONFOR` corresponda ao controle ZZ1 selecionado.

O projeto registra `FilBrowse()` / `EndFilBrw()` como alternativa para envolver o `mBrowse` quando o filtro da versão vinculada não for respeitado pelo ambiente.

### 8.3 STTZZLIB.PRW

| Função | Responsabilidade |
|---|---|
| `NomeFornecedor(cFornec,cLoja)` | Retornar o nome do fornecedor por `POSICIONE` na SA2. |
| `NomeProduto(cCodPro)` | Retornar a descrição do produto. |
| `PercNaoConforme(nOk,nNok)` | Calcular o percentual de itens não conformes, evitando divisão por zero. |
| `CertificadoVencendo(dValCer)` | Indicar se o certificado vence dentro de 30 dias. |
| `GravarLogTCC(cFuncao,oErro)` | Registrar informações técnicas de erro em log. |

## 9. Consultas Padrão — SXB

| Consulta | Campos apresentados |
|---|---|
| Busca ZZ1 | `ZZ1_CODIGO`, `ZZ1_NOMEFO`, `ZZ1_VALCER` |
| Busca SA2 | `A2_COD`, `A2_LOJA`, `A2_NOME` |
| Busca SB1 | `B1_COD`, `B1_DESC`, `B1_UM` |

## 10. Menu do SIGACOM

```text
Cadastros
└── Controle ISO 9001
    ├── Controle de Fornecimento (ZZ1) → USER FUNCTION STTZZ1
    └── Ocorrências de Fornecedores (ZZ2) → USER FUNCTION STTZZ2
```

## 11. Tratamento de Erros

As operações de banco de dados devem ser protegidas por `BEGIN SEQUENCE`, com mensagem amigável ao usuário, registro técnico por `GravarLogTCC()` e rollback quando a operação estiver dentro de transação e houver necessidade de desfazer a gravação.

A biblioteca centraliza o registro do log para reduzir duplicação de código e facilitar o diagnóstico.

## 12. Estrutura de Entrega

```text
TCC/
├── Dados-e-Dicionario/
│   ├── sa2990.dbf
│   ├── sb1990.dbf
│   ├── sigacom.xnu
│   ├── six990.dbf
│   ├── sx2990.dbf
│   ├── sx3990.dbf
│   ├── sx7990.dbf
│   ├── sxb990.dbf
│   ├── zz1990.dbf
│   └── zz2990.dbf
├── TCC.PRJ
├── STTZZ1.PRW
├── STTZZ2.PRW
├── STTZZLIB.PRW
└── README.md
```

## 13. Procedimento de Instalação

1. Realizar backup do ambiente e do dicionário antes da implantação.
2. Disponibilizar/importar as definições das tabelas ZZ1 e ZZ2, seus campos, índices, validações, gatilhos e consultas padrão.
3. Validar a criação física das tabelas e a consistência dos índices.
4. Disponibilizar os fontes `STTZZ1.PRW`, `STTZZ2.PRW` e `STTZZLIB.PRW` no projeto.
5. Compilar os fontes no repositório correspondente ao ambiente.
6. Atualizar o menu do SIGACOM com as opções Controle de Fornecimento e Ocorrências de Fornecedores.
7. Reiniciar a sessão do Protheus quando necessário para recarregar menu/dicionário.
8. Executar testes funcionais com fornecedores e produtos previamente cadastrados.

## 14. Roteiro de Testes

| Teste | Resultado esperado |
|---|---|
| Incluir ZZ1 com fornecedor válido | Registro aceito e dados relacionados preenchidos conforme configuração. |
| Informar fornecedor inexistente | Sistema deve impedir a gravação/avanço conforme validação. |
| Informar tolerância fora de 0–100 | Sistema deve rejeitar o valor. |
| Informar validade inferior à data-base na inclusão | Sistema deve rejeitar a data. |
| Incluir ZZ2 vinculada à ZZ1 | Controle, fornecedor e loja devem manter o vínculo esperado. |
| Informar produto inexistente | Sistema deve rejeitar o produto. |
| Informar data futura na ZZ2 | Sistema deve rejeitar a ocorrência. |
| Calcular percentual NC | Percentual deve usar `QTDNOK/(QTDOK+QTDNOK)*100`. |
| Acionar Ocorrências na ZZ1 | Abrir ZZ2 apresentando somente registros do controle selecionado. |

## 15. Evidências de Homologação

As evidências visuais existentes no documento original foram extraídas para a pasta `EVIDENCIAS/`. Para que apareçam no GitHub, suba **o `README.md` e a pasta `EVIDENCIAS` juntos**.


### Evidência 01

![Evidência 01](EVIDENCIAS/evidencia-01.png)

### Evidência 02

![Evidência 02](EVIDENCIAS/evidencia-02.png)

### Evidência 03

![Evidência 03](EVIDENCIAS/evidencia-03.png)

### Evidência 04

![Evidência 04](EVIDENCIAS/evidencia-04.png)

### Evidência 05

![Evidência 05](EVIDENCIAS/evidencia-05.png)

### Evidência 06

![Evidência 06](EVIDENCIAS/evidencia-06.png)

### Evidência 07

![Evidência 07](EVIDENCIAS/evidencia-07.png)

### Evidência 08

![Evidência 08](EVIDENCIAS/evidencia-08.png)

### Evidência 09

![Evidência 09](EVIDENCIAS/evidencia-09.png)

### Evidência 10

![Evidência 10](EVIDENCIAS/evidencia-10.png)

### Evidência 11

![Evidência 11](EVIDENCIAS/evidencia-11.png)

### Evidência 12

![Evidência 12](EVIDENCIAS/evidencia-12.png)

### Evidência 13

![Evidência 13](EVIDENCIAS/evidencia-13.png)

## 16. Pontos de Atenção

- Os nomes físicos dos campos devem ser usados exatamente como definidos no SX3, principalmente `ZZ1_LOJAFO` e `ZZ2_LOJAFO`.
- Campos referenciados no quarto parâmetro de `POSICIONE` devem ser informados como texto, por exemplo `"A2_NOME"`.
- O formato `X3_PICTURE` dos campos numéricos deve ser configurado para permitir a digitação conforme tamanho e decimais.
- As regras de legenda do ambiente utilizam `BR_VERMELHO`, `BR_AMARELO` e `BR_VERDE`, conforme a especificação.
- O vínculo entre ZZ1 e ZZ2 deve preservar a integridade do código de controle.

## 17. Critérios de Aceite

A entrega pode ser considerada tecnicamente homologada quando:

- as tabelas e índices estiverem disponíveis;
- as validações impedirem dados inválidos;
- os gatilhos preencherem os campos previstos;
- as rotinas ZZ1 e ZZ2 executarem as operações de manutenção;
- o vínculo ZZ1 → ZZ2 funcionar;
- o acesso pelo SIGACOM estiver disponível.

## 18. Conclusão

A solução estrutura um controle de qualidade de fornecedores dentro do Protheus, integrando dados customizados aos cadastros padrão SA2 e SB1. O projeto aplica conceitos de dicionário de dados, índices, validações, gatilhos, `mBrowse`, funções ADVPL reutilizáveis e tratamento de erros.
