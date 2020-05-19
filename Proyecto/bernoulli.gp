#!/usr/bin/gnuplot -persist


set terminal png


set output "bernoulli.png"

set logscale xy


set xrange [1e-20:2e-1]
set yrange [10:95]


set xtics ("1e-20" 1e-20, "1e-10" 1e-10, "1e-5" 1e-5, "1e-4" 1e-4, "1e-3" 1e-3, "1e-2" 1e-2, "1e-1" 1e-1)
set ytics ("10" 10, "15" 15, "20" 20, "25" 25, "30" 30, "35" 35,"40" 40, "50" 50, "60" 60, "70" 70, "80" 80, "95" 95)





plot "erorr_bernoulli.out" u 1:2  w lp 

