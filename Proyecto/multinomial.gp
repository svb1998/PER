#!/usr/bin/gnuplot -persist


set terminal png 


set output "multinomial.png"

set logscale xy


set xrange [1e-10:0.2]
set yrange [15:40]


set xtics ("1e-10" 1e-10, "1e-9" 1e-9, "1e-8" 1e-8, "1e-7" 1e-7, "1e-6" 1e-6, "1e-5" 1e-5, "1e-4" 1e-4, "1e-3" 1e-3, "1e-2" 1e-2, "1e-1" 1e-1)
set ytics ("10" 10, "15" 15, "20" 20, "25" 25, "30" 30, "35" 35,"40" 40)


set label "Epsilon" at 0.2,15.5 right
set label "Error (%)" at 0.00000000015,37.5 left
set label "MNIST Multinomial" at 0.0000005,25 center font "HelveticaBold,30"



plot "erorr_multinomial.out" u 1:2  w lp 

