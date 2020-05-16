#!/usr/bin/gnuplot -persist


set terminal png


set output "gauss.png"

set logscale xy


set xrange [1e-10:9e-1]
set yrange [2:25]


set xtics ("1e-10" 1e-10, "1e-9" 1e-9, "1e-8" 1e-8, "1e-7" 1e-7, "1e-6" 1e-6, "1e-5" 1e-5, "1e-4" 1e-4, "1e-3" 1e-3, "1e-2" 1e-2, "1e-1" 1e-1, "9e-1" 9e-1)
set ytics ("2" 2, "5" 5, "10" 10, "15" 15, "20" 20)


set label "Epsilon" at 650,21,2 right
set label "Error (%)" at 0.92,95 left
set label "Original" at 0.92,31 left
set label "MNIST Gauss" at 10,65 center font "HelveticaBold,30"



plot "erorr_gauss.out" u 1:2  w lp 

