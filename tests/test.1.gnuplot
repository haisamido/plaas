set terminal dumb
plot sin(x)
data_file="./test.csv"

set datafile separator ","
set timefmt x "%Y-%j-%H:%M:%S"
set xdata time
set format x "%Y-%j-%H:%M"
