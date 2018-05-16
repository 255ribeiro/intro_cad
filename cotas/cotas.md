# Guia de Configuração de cotas (dimensões) no Autocad.

Existem várias formas de configurar cotas no Autocad. A estratégia apresentada neste guia se aplica para arquivos com **metros** como unidade de desenho, utilizando escala de plotagem **1000/x**.

## Caixa de diálogo de estilos de dimensões (Dimension Style Manager).

Para abrir a caixa de diálogo de configuração de dimensões **(Dimension Style Manager)** basta digitar o comando **dimstyle(dst)** na linha de comando.

![](dsm.jpg)


Na caixa de diálogo é possível:
* ver o estilo de dimensão atual em **Current dimension style**(1);
* alterar o estilo de dimensão atual selecionando um estilo em **Styles**(2) e clicando no botão **Set Current**(4);
* visualizar, no quadro **Styles**(2), todos os estilos carregados no arquivo ou apenas os estilos usados (desenhados) no arquivo através do seletor **List**(3);
* criar um novo estilo a partir de um estilo selecionado(2) clicando no botão **New**(5);
* ou modificar um estilo selecionado(2) clicando no botão **Modify**(6)

A imagem no quadro **Preview of** mostra como estão configuradas as cotas e uma descrição pode ser vista logo abaixo no quadro **Description**.

## Criando um novo estilo de dimensões.

Para criar uma nova cota clique no Botão **New**(5) para abrir a caixa de diálogo **Create New Dimension Style**.

![](novaCota.jpg)

* No campo **New Style Name**(1) digite um nome para seu novo estilo de cota (indique a escala que pretende usar).
* No campo **Start With**(2) selecione um dos estilos existentes para basear sua configuração.
* clique no botão **Continue**.

##### Obs: Neste guia não será usada a opção *Annotative*.

## Configurando um novo estilo de dimensões.

Nas configurações das cotas, cinco das sete abas devem ser configuradas:
* **Lines**(A);
* **Symbols and Arrows**(B);
* **Text**(C);
* **Fit**(D);
* **Primary Units**(E).

![](novaCotaAbas.jpg)

### Lines (A):

![](abaLines.jpg)

No quadro **Dimension Lines** recomenda-se a configuração dos seletores **Color**(A1), **Linetype**(A1) e **Lineweight**(A1) como **Bylayer**. Caso o campo **Extend beyond ticks** esteja desabilitado, mude os seletores **First**(B1) e **Second**(B2) na caixa **Arrowheads** na aba **Symbols and Arrows**(B) Para um **tick** ou **dot**.

### Symbols and Arrows (B):

![](abaSymb.jpg)

### Text (C):

![](abaText.jpg)


### Fit (D):

![](abaFit.jpg)

### Primary Units (E):

![](abaPU.jpg)
