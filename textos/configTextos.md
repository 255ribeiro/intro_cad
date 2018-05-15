# Guia de Configuração de Textos no Autocad.
<hr>

Existem três comandos para desenho de textos no Autocad:

1. **text(dt)**;
2. **mtext(t)(mt)**;
3. **attdef(att)**.

O comando **text(dt)** cria textos de uma única linha. O comando **mtext(t)** cria blocos de texto com múltiplas linhas. O comando **attdef(att)** define atributos, muito utilizados em blocos de anotações e carimbo.

## Caixa de Diálogo de Estilos de Texto.

Para abrir a caixa de diálogo de configuração de textos basta digitar o comando **style(st)** na linha de comando.

![](textStyleDiag.png)


O quadro **Styles:** Mostra uma lista com os estilos carregados no arquivo. Abaixo da lista, tem um seletor com as opções **All styles**(para todos os estilos carregados no arquivo) e **Styles in use** para mostrar apenas os etilos que foram usados em textos desenhados no arquivo.

## Criando um Estilo Novo de Texto.

Para criar um novo estilo de textos clique no botão **New** na lateral direita da caixa de diálogo. Em seguida, crie um nome para seu estilo de texto e clique no botão **OK**.

![](novoEstilo.jpg)

Em seguida escolha uma fonte no quadro **Font**, seletor **Font Name**. Existem dois tipos de fonte:

Os tipos **técnico**, identificados com um símbolo de um compasso, e os tipos **True Type**, identificados com duas letras "T" sobrepostas.

![](tiposDeFonte.jpg)

As fontes **técnicas** desenham as letras com linhas simples. Para as fontes técnicas, a espessura de pena da fonte tem forte influência sobre a aparência do texto e deve ser mais grossa quando o texto é maior.

As fontes **True Type** são fontes padrão do Windows, sua espessura é aumentada ou diminuída automaticamente de acordo com tamanho de impressão da letra.

## Definindo a Altura do Texto.

A altura do texto é definida no campo **height** do quadro **Size**.

![](textHeight.png)

A opção **Annotative** não será usada neste guia.

Quando ajustado para 0.0000 (zero), o tamanho do texto será configurado na linha de comando. A escala de plotagem deve ser levada em conta quando definimos a altura dos textos. Para criar um texto de altura 3,5mm na escala 1/100, deve-se multiplicar o tamanho do texto na unidade desenho pelo denominador da escala **0.0035 x 100**. Neste caso, o valor **0.35** deve ser digitado no campo **Height**.

finalize a criação do estilo de texto clicando no botão **Apply** na parte inferior da caixa de diálogo.

## Selecionado o Estilo de Texto a ser Utilizado.

Como podemos ver no quadro **Styles**, podem existir muitos estilos de texto carregados em um mesmo desenho. Para selecionar o estilo de texto que será usado quando os comando de criação de texto forem acionados:

1. Selecione o estilo de texto que deseja utilizar no quadro **Styles**;
2. clique no botão **Set Current** na direita da caixa de diálogo.

O estilo ajustado como padrão será utilizado quando para criação de textos até que um outro estilo seja definido como atual (botão **Set Current**).

## Exercício:

1. Criar estilos de texto com as seguintes configurações:

<br>

| Nome |Fonte | Altura | Escala |
|:-:          |:-:   |:-:  |:-:    |
| 3.5mm_1_100 |Arial | 3.5 | 1/100 |
| 3mm_1_100 |Arial | 3.0 | 1/100 |
| 2.5mm_1_100 |Arial | 2.5 | 1/100 |
| 2mm_1_100 |Arial | 2.0 | 1/100 |
| 3.5mm_1_50 |Arial | 3.5 | 1/50 |
| 3mm_1_50 |Arial | 3.0 | 1/50 |
| 2.5mm_1_50 |Arial | 2.5 | 1/50 |
| 2mm_1_50 |Arial | 2.0 | 1/50 |

<br>

2. Escreva o nome dos estilos de texto com os comandos **text(dt)** e **mtext(t)(mt)**

<hr>
<hr>
