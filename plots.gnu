set terminal postscript eps enhanced
set logscale y
set mytics 10
set grid xtics ytics mytics
set format y "10^{%L}"

set xlabel "E_b/N_0, dB"
set ylabel "FER"

set output "GCC.eps"
plot "gcc_bch_8_7.ber" using 1:2 title "(1016,507) code" with lp lt 1 pt 3,\
     "gcc_bch_16_6.ber" using 1:2 title "(1008,505) code" with lp lt 1 pt 4,\
     "gcc_bch_32_5.ber" using 1:2 title "(992,490) code" with lp lt 1 pt 5,\
     1000*erfc(2*10**(x/10)) title "erfc" with lines lt 2