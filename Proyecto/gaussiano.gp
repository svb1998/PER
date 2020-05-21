#!/usr/bin/gnuplot -persist


set terminal png


set output "gauss.png"

set logscale xy


set xrange [5e-10:12e-1]
set yrange [4:22]


set xtics ( "1e-9" 1e-9, "1e-8" 1e-8, "1e-7" 1e-7, "1e-6" 1e-6, "1e-5" 1e-5, "1e-4" 1e-4, "1e-3" 1e-3, "1e-2" 1e-2, "1e-1" 1e-1, "9e-1" 9e-1)
set ytics ("5" 5, "10" 10, "15" 15, "20" 20)


set label "Error (%)" at 83e-10,20.4 right
set label "Alpha" at 8e-1,4.2 right
set label "MNIST Gaussian" at 3.8e-4,15 center font "HelveticaBold,25"



plot "erorr_gauss.out" u 1:2  w lp 

