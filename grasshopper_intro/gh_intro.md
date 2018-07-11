# Grasshopper Introdução

O **Grasshopper** é um *plugin* do *Rhinoceros 3D* que habilita modelagem paramétrica em um ambiente baseado em nós.

* Para instalar o grasshoper no *Rhinoceros 5* siga as [instruções](https://255ribeiro.github.io/LPACAF/guia_install/)

* No *Rhinoceros 6* o Grasshopper é instalado junto com o programa.

* Para adicionar componentes ao grasshopper, visite o site [food4rhino](http://www.food4rhino.com/).

* O [Site do Grasshoper](https://www.grasshopper3d.com/) abriga o forum oficial da ferramenta e uma página de [tutoriais](https://www.grasshopper3d.com/page/tutorials-1)

## Abrindo o Grasshopper

Para iniciar o grasshopper, digite **grasshopper** na linha de comando.

![Tela do Grasshopper](TelaGH.png)

A interface é dividia em abas, cada aba contem um ou mais paineis que abrigam os componentes (as vezes chamados de baterias) do Grasshopper.

A aba **Params** contem os componetes de entrada do grasshopper.

## Iniciando uma definição

[Introdução: Arquivo base](Grasshopper_introdução.gh)

Para iniciar uma definição no **Grashopper** clique no componete **Point** da aba **Params** no painel **Geometry**. Clique na tela de trabalho(*canvas*) para posicionar o componete no editor de código.

![Componente Point](pointComp.jpg)

Com o componete **Point** posicionado, clique com o botão direito no componente e sselecione a opção **Set One Point**.

![Set One Point](setOnepoint.jpg)

A opção **Set One Point** alterna para a nterface do **Rhino**, permitindo a seleção de um ponto por coordenadas, por um ponto desenhado na interface do **Rhino** ou um ponto sobre uma curva. Caso a opção *Coordinates* não esteja aparecendo na linha de comando, clique sobre o texto **Type** e selecione a opção coordinates.

![Set Point Type](setPointType.png)

Com a opção coordinates selecionada, O ponto pode ser selecionado clicando na tela ou digitando as corrdenadas.

![Set Coord](setPointCoord.png)

Digite as coordeandas 0,0,1 e pressione **enter** para voltar á interface do **Grasshopper**.

Para mover(copiar) o ponto em uma direção sentido e distância específica, clique a aba **Trasnform**, no painel **Euclidean**, selecione o componente **Move**.

![move](MoveComp.png)

Arraste a saida á esquerda do componente **Point** e concete com a entrada **Geometry** do componente **Move**. Com isso o ponto será movido na distância e direção *default* do componente (10 unidades na direção do eixo Z).

![Move Geometry](MoveConect.png)

![Move Geometry 2](move2.png)

### Definindo Direção de Distância

Para definir uma direção, na aba **Vector**, no painel **Vector**, selecione o componente **Unit Z**. conecte a saida do componente a entrada **Motion** do componente **Move**.

![Unit z](unitZ.png)

O componente **Unit Z** é um versor (vetor unitário) na direção Z. Para definir a distância, na aba **Params**, no painel **Input** selecione a opção **Slider**.

![Slider 1](slider1.png)

Com um clique duplo na parte esquerda do **Slider**, altere o valor da opção **MAx** para 100 e clique em **Ok**. Conecte a saída do **Slider** na entrada do componente **Unit Z**.

![Edit Slider](editSlider.png)

### Criando uma Linha Entre os Pontos

Na aba **Curve**, no painel **Primitive**, selecione o componente **Line**. Conecte a saída do componente **Point** na entrada **Start Point** do componente **Line** e a saída **Geometry** do componente **Move** na entrada **End Point** do componente **Line**.

### Criando uma Coluna (Elemento Tubular) a Partir de uma Linha

Na aba **Surface**, no painel **Freeform**, selecione o componente **Pipe**. Concete a saída do componente **Line** na entrada **Curve** do componente **Pipe**. Conecte um **Slider** na entrada **Radius** do componente **Pipe**. Na entrada **Cap** do componente **Pipe**, clique com o botão direito e selecione a opção **Flat**.

### Criando Colunas a Partir de uma Curva

na interface do **Rhinoceros** desenhe uma reta (line) ou uma curva.

Na aba **params**, no painel **Geometry**, selecione o componente **Curve**. Clique com o botão direito no componente e selecione a curva na interface do rhinoceros clicando sobre a curva desenhada.

Na aba **Curve**, no painel **Division** selecione o componente **Divide Curve**. Conecte a saída do componente **Curve** na entrada **Curve** do componente **Divide Curve**.

Na aba **Params**, no painel **Input** selecione a opção **Slider**. com um clique duplo na parte esquerda do **Slider**, altere o valor da opção **R** para **N** e a opção **Max** para 100 e clique em **Ok**. Conecte a saída do **Slider** com a entrada **Count** do componente **Divide Curve**.

Conecte a saída **Points** do componente **Divide Curve** á entrada do componente **Point**.

![exemplo01](exemplo01.png)

## Exemplos

[Elementos tubulares uma Curva](ELEMENTOS_TUBULARES_UMA_CURVA.gh)

[Elementos tubulares duas Curvas](ELEMENTOS_TUBULARES_DUAS_CURVAS.gh)

[Exemplo Janelas](exemplo_janela.gh)

[Guarda Corpo](GUARDA-CORPO.gh)

[Exemplo Mies](Exemplo_Mies.gh)