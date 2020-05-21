#!/usr/bin/gnuplot -persist


set terminal png


set output "bernoulli.png"

set logscale xy


set xrange [1.2e-21:4e-1]
set yrange [10:25]


set xtics ("1e-20" 1e-20, "1e-10" 1e-10, "1e-5" 1e-5, "1e-4" 1e-4, "1e-3" 1e-3, "1e-2" 1e-2, "1e-1" 1e-1)
set ytics ("10" 10, "15" 15, "20" 20, "25" 25, "30" 30, "35" 35,"40" 40, "50" 50, "60" 60, "70" 70, "80" 80, "95" 95)

set label "Error (%)" at 75e-20,24.4 right
set label "Epsilon" at 3e-1,10.3 right
set label "Bernoulli" at 1e-10,18.5 center font "HelveticaBold,25"


plot "erorr_bernoulli.out" u 1:2  w lp 

