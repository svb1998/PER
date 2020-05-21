#!/usr/bin/gnuplot -persist


#set terminal postscript eps font "Helvetica,24"

set terminal png

#
# Nombre del fichero de salida
#

set output "wp-exp.png"

# Establece que los ejes estén en escala logarítmica
# para observar más fácilmente valores muy cercanos entre si

set logscale xy

#
# Rangos del eje x y del eje y
#

set xrange [0.9:710]
set yrange [20:100]

# Define los puntos de referencia (tics) sobre el eje x y el eje y
# Entre paréntesis se indican separados por coma la etiqueta de texto
# entre comillas dobles y la posición en ese eje donde aparece la
# etiqueta

set xtics ("1" 1, "2" 2, "5" 5, "10" 10, "20" 20, "50" 50, "100" 100, "200" 200, "500" 500)
set ytics ("1" 1, "2" 2, "5" 5, "10" 10, "20" 20,"30" 30,"40" 40, "50" 50,"60" 60,"70" 70,"80" 80,"90" 90, "100" 100)

# Definimos el texto que usamos para poner etiquetas en la gráfica:
# - El eje x "Dimensionalidad"
# - El eje y "Error (%)"
# - La línea horizontal que representa la tasa de error sin aplicar PCA "Original"
# - El título de la gráfica "MNIST 1-NN"
#
# Después del texto que se muestra en la gráfica aparecen las coordenadas (at x,y)
# donde debe aparecer la etiqueta seguido de como se alinea el texto (right, left, center)
# e incluso el tipo y tamaño de la fuente: font  "HelveticaBold,30"

set label "Dimensionalidad" at 650,21,2 right
set label "Error (%)" at 0.92,95 left
set label "Original" at 0.92,31 left
set label "MNIST 1-NN" at 100,65 center font "HelveticaBold,30"

# El comando plot representa las dos curvas que aparecen en la
# gráfica. La primera curva es la de PCA y la segunda, la Original,
# es decir, sin aplicar PCA.
#
# En ese comando plot la especificación de cada una de las curvas está
# separada por coma de la otra
# Primera: "pca+knn-exp.out" u 1:2 t "PCA" w lp lw 2 lt 1 ps 2.0
# Segunda: 2.82 not w l lw 4 lt 2
#
# Sobre la primera curva, el fichero pca+knn-exp.out es un fichero de
# texto con dos columnas. La primera columna es el número de
# dimensiones a los cuales proyectas y la segunda columna es la tasa
# de error del clasificador de 1 vecino más cercano cuando utilizas
# ese número de dimensiones.
#
# El comando plot para la primera curva se interpreta de la siguiente
# manera: el fichero pca+knn-exp.out se representa gráficamente
# mediante una curva usando (u) la columna 1 como eje x y la columna 2
# como eje y siendo el título de la curva "PCA", el tipo de curva es
# de una línea con los puntos experimentales sobre la misma
# "with linespoints" (w lp), el "linewidth" de la curva es 2 (lw 2), el "linetype"
# es la 1 (lt 1) y el "pointsize" es 2.0 (ps 2.0)
#
# El plot para la segunda curva es una línea horizontal cuyo valor
# constante es 2.82 para todo valor de x, no quiero título "notitle" (not) para esta curva,
# el tipo de curva es una línea "with line" (w l) cuyo linewidth es 4 (lw 4)
# y el tipo de línea es la 2 (lt 2)

plot "wp-exp.out" u 1:2 t "PCA" w lp lw 2 lt 1 ps 2.0, 32.55 not w l lw 4 lt 2

# Si quieres saber más sobre los anchos de línea, tipos de línea/punto, etc. ejecuta
# "gnuplot" desde el interprete de comandos, y dentro de gnuplot ejecuta el comando "test"
