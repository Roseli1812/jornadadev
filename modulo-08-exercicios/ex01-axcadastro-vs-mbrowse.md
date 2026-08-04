### a. Quando vocà usaria AxCadastro e quando usaria mBrowse? Dà um exemplo de cada.

Eu usaria o AxCadastro quando precisasse criar um cadastro simples, aproveitando as funcionalidades padr∆o do Protheus, como incluir, alterar, excluir e consultar registros.

Exemplo: criar um cadastro de pets usando a tabela ZA1.

J† o mBrowse eu usaria quando precisasse montar uma tela de consulta mais personalizada, com filtros, cores, legendas ou outras funcionalidades espec°ficas.

Exemplo: uma tela para listar os pets e destacar em vermelho os que tàm mais de 10 anos.

---

### b. Cite tràs coisas que o mBrowse faz e o AxCadastro n∆o faz.

O mBrowse permite fazer algumas personalizaá‰es que o AxCadastro n∆o possui de forma padr∆o, por exemplo:

* Colocar cores diferentes nas linhas usando legendas (`aColors`).
* Criar filtros e consultas personalizadas.
* Escolher quais colunas ser∆o exibidas e como elas ser∆o apresentadas.

---

### c. Na configuraá∆o de legendas (aColors), por que a regra ".T." deve ficar por £ltimo?

Porque a condiá∆o .T. significa verdadeiro. Como ela sempre Ç verdadeira, se ficar no comeáo, o sistema vai aplicar essa regra primeiro e n∆o vai verificar as outras condiá‰es.

Por isso, ela deve ficar por £ltimo, funcionando como uma regra padr∆o para os registros que n∆o atenderem Ös condiá‰es anteriores.

---

### d. Qual a diferenáa entre um campo Virtual (X3_RELACAO) e um gatilho (SX7) para preencher o nome do cliente?

O campo Virtual n∆o grava informaá∆o no banco de dados. Ele apenas mostra um valor que Ç buscado em outra tabela quando o registro Ç exibido.

J† o gatilho (SX7) executa uma aá∆o quando algum campo Ç preenchido ou alterado. Ele pode copiar informaá‰es para outro campo e gravar esse valor na tabela.

Por isso, eu entendo que o campo virtual serve apenas para exibir uma informaá∆o, enquanto o gatilho serve para executar uma aá∆o automaticamente, como preencher um campo quando outro Ç informado.
