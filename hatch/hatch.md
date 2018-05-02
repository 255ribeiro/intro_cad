## Guia de Hachuras Autocad

O comando de criação de hachuras pode ser acionado pela linha de comando hatch(h) ou pelo ícone da figura abaixo:

![comando hatch no menu ribbon](.\hatchicone.png)

O comando aciona uma caixa de diálogo ou um menu especial do Ribbon.

a variável do sistema HPDLGMODE controla a exibição da caixa de diálogo. Para acompanhar esse guia, ajuste a variável para 1.

Na caixa de diálogo existe um botão em forma de seta. Ele mostra configurações ocultas na caixa de diálogo.

![caixas de díalogo de hachuras, simples e completa](.\hatch_dia_boxes.png)

Os tipos e padrões de hachura são acessados no quadro superior esquerdo da caixa de diálogo. Na figura a baixo podemos ver que a seleção do tipo de hachura habilita e desabilita opções dos quadros **type and pattern** e **angle and scale**

![](.\hatch_type_options.png)

- Selecione o tipo **predefines** e o padrão **solid**
- para este tipo de hachura não é necessário utilizar o quardro **angle and scale**
- No quadro **Boundaries** (à direita do quadro **type and pattern**) é possível selecionar objetos para serem hachurados:
    1. a opção **Add pick points** retorna para a tela do Autocad e permite que as áreas sejam selecionadas clicando nos pontos internos de conjuntos fechados de entidades de Desenho.
    2. a opção **Add select object** permite a seleção de entidades fechadas (círculos, polilinhas ou splines fechadas e regiões)
- No quandro **options** é possível selecionar o layer para colocar a hachura.
