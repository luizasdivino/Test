install.packages("tidyverse")

packageVersion("tidyverse")

library(tidyverse)

library(ggplot2)

?mpg
#> # A tibble: 234 x 11
#>   manufacturer model displ  year   cyl trans      drv     cty   hwy fl    class 
#>   <chr>        <chr> <dbl> <int> <int> <chr>      <chr> <int> <int> <chr> <chr> 
#> 1 audi         a4      1.8  1999     4 auto(l5)   f        18    29 p     compa~
#> 2 audi         a4      1.8  1999     4 manual(m5) f        21    29 p     compa~
#> 3 audi         a4      2    2008     4 manual(m6) f        20    31 p     compa~
#> 4 audi         a4      2    2008     4 auto(av)   f        21    30 p     compa~
#> 5 audi         a4      2.8  1999     6 auto(l5)   f        16    26 p     compa~
#> 6 audi         a4      2.8  1999     6 manual(m5) f        18    26 p     compa~
#> # ... with 228 more rows


# grafico vazio
ggplot(data = mpg)

# testando diferentes variaveis do banco de dados mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = cyl))

#testando cores
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# testando tamanhos
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
#> Warning: Using size for a discrete variable is not advised.


# testando transparencia do grafico
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# testando formato das bolinhas
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# testando transparencia dos pontos
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# testandoa estetica do formato
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# testando cores especificas
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# explicando porque o grafico nao fica azul
# a color = blue precisa ficar fora do parenteses
# dos eixos x e y
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

?geom_point

# adicionano mais de duas variaveis
# aqui se pode ver como duas variaveis agem
# grupos ou categorias diferentes
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# aqui se tem duas variaveis na interseccao entre
# dois grupos 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

# este aqui e o debaixo representam a mesma informacao
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# este aqui tem uma linha pra representar a curva
# e tambem a dispersao
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# aqui se tem tres variaveis
# uma variavel e categorica categoricas e 2 sao continuas
# o ggplot esta configurado pra alterar o "formato"
# da linha em relacao à variavel categorica
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

# aqui podemos botar tambem as cores
# em funcao do drv
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = drv))

# aqui é um plot "básico", de linha
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# aqui é um gráfico de linha com 3 variaveis
# incluindo aqui os diferentes tipos de tração (drv)
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

# gráfico igual ao de cima mas com cores em função da tração
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

# gráfico igual ao de cima mas com cores em função da tração
# com legenda
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = TRUE
  )

# grafico com diferentes tipos de representacao
# de uma mesma variavei
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# codigo desta forma vai aplicar as coisas de "mapping" como globais
# portanto o grafico fica igual ao de cima
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

# é possível também utilizar diferentes estéticas em cada camada
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

# utilizacao da funcao "filter", que seleciona apenas algumas
# categorias da variavei desejada
# DEU ERRO AQUI EM "=="
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

# will these 2 graphs look different? 
# sao iguais porque o comando faz com que a funcao
# seja aplicda em todas as camadas
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

# fazer atividade 6 do capitulo 3.6

# ?diamonds = banco de dados de diamantes
# graficos em barra cinza com contorno colorido
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))

# grafico em barra colorido preenchido
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

# grafico em barra mudando a cor de acordo com a variavel clarity
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

# grafico em barra mas com overlaping (nao muito util para graficos em barra)
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")

# grafico em barra mas sem estar preenchido
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")

# grafico em barra em funcao do corte e da nitidez
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

# position = dodge deixa objetos diferentes lado a lado
# bom para comparacao
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

# PESQUISAR "overplotting" e "jitter" depois pra ver com mais atenção

# gramática do código 
# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(
#     mapping = aes(<MAPPINGS>),
#     stat = <STAT>, 
#     position = <POSITION>
#   ) +
#   <COORDINATE_FUNCTION> +
#   <FACET_FUNCTION>




---
  