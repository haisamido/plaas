# plaas
Plotting as a Service (PLaaS)

# How to
docker build -t plaas haisamido/plaas
docker run -d -p 2222:22 plaas
# The password is the string root
ssh -t root@localhost -p 2222 "/usr/bin/gnuplot"
