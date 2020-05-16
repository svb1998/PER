#!/usr/bin/gnuplot -persist


set terminal png


set output "gauss+pca.png"

set logscale xy


set xrange [0.9:710]
set yrange [1.7:100]

set xtics ("1" 1, "2" 2, "5" 5, "10" 10, "20" 20, "50" 50, "100" 100, "200" 200, "500" 500)
set ytics ("1" 1, "2" 2, "5" 5, "10" 10, "20" 20, "50" 50, "100" 100)



plot "error_gauss+pca.out" u 2:3 title "1e-10" w lp, "error_gauss+pca.out" u 5:6 title "1e-9" w lp, "error_gauss+pca.out" u 8:9 title "1e-8" w lp, "error_gauss+pca.out" u 11:12 title "1e-7" w lp, "error_gauss+pca.out" u 14:15 title "1e-6" w lp , "error_gauss+pca.out" u 17:18 title "1e-5" w lp , "error_gauss+pca.out" u 20:21 title "1e-4" w lp , "error_gauss+pca.out" u 23:24 title "1e-3" w lp , "error_gauss+pca.out" u 26:27 title "1e-2" w lp , "error_gauss+pca.out" u 29:30 title "1e-1" w lp , "error_gauss+pca.out" u 32:33 title "9e-1" w lp 

