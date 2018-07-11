# Grasshopper Introdução

O **Grasshopper** é um *plugin* do *Rhinoceros 3D* que habilita modelagem paramétrica em um ambiente baseado em nós.

* para instalar o grasshoper no *Rhinoceros 5* siga as [instruções](https://255ribeiro.github.io/LPACAF/guia_install/)

* No *Rhinoceros 6* o Grasshopper é instalado junto com o programa.

* Para adicionar componentes ao grasshopper, visite o site [food4rhino](http://www.food4rhino.com/).

* O [Site do Grasshoper](https://www.grasshopper3d.com/) abriga o forum oficial da ferramenta e uma página de [tutoriais](https://www.grasshopper3d.com/page/tutorials-1)

## Abrindo o Grasshopper

Para iniciar o grasshopper, digite **grasshopper** na linha de comando.

![Tela do Grasshopper](TelaGH.png)

A interface é dividia em abas, cada aba contem um ou mais paineis que abrigam os componentes (as vezes chamados de baterias) do Grasshopper.

A aba **Params** contem os componetes de entrada do grasshopper.

## Iniciando uma definição

[Introdução Arquivo base](Grasshopper_introdução.gh)

Para iniciar uma definição no **Grashopper** clique no componete point da aba **Params** no painel **Geometry**. Clique na tela de trabalho(*canvas*) para posicionar o componete no editor de código.

![Componente Point](pointComp.jpg)

Com o componete **Point** posicionado, clique com o botão direito no componente e sselecione a opção **Set One Point**.

![Set One Point](setOnepoint.jpg)

A opção **Set One Point** alterna para a nterface do **Rhino**, permitindo a seleção de um ponto por coordenadas, por um ponto desenhado na interface do **Rhino** ou um ponto sobre uma curva. Caso a opção *Coordinates* não esteja aparecendo na linha de comando, clique sobre o texto **Type** e selecione a opção coordinates.

![Set Point Type](setPointtype.png)

Com a opção coordinates selecionada, O ponto pode ser selecionado clicando na tela ou digitando as corrdenadas.

![Set Coord](setPointCoord.png)

Digite as coordeandas 0,0,1 e pressione **enter** para voltar á interface do **Grasshopper**.

Para mover(copiar) o ponto em uma direção sentido e distância específica, clique a aba **Trasnform**, no painel **Euclidean**, selecione o componente **Move**.

Arraste a saida á esquerda do componente **Point** e concete com a entrada **Geometry** do componente **Move**. Com isso o ponto será movido na distância e direção *default* do componente (10 unidades na direção do eixo Z).

### definindo direção de distância



## Exemplos

[Elementos tubulares Uma Curva](ELEMENTOS_TUBULARES_UMA_CURVA.gh)

[Elementos tubulares duas Curvas](ELEMENTOS_TUBULARES_DUAS_CURVAS.gh)

[Exemplo Janelas](exemplo_janela.gh)

[Guarda Corpo](GUARDA-CORPO.gh)

[Exemplo Mies](Exemplo_Mies.gh)