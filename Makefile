GRAPH = gnuplot

CC = clang
CFLAGS = -Wall -O0 -g 
LFLAGS = -O0 -g
LIBS = -lgsl -lm

glider: glider-demo.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

res1: glider
	./glider > res1

glider.png: glider.gpl res1
	$(GRAPH) glider.gpl

launch-angle: launch-angle.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

res-angle: launch-angle
	./launch-angle > res-angle

launch-angle.png: launch-angle.gpl res-angle
	$(GRAPH) launch-angle.gpl
	
initial-velocity: initial-velocity.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

res-velocity: initial-velocity
	./initial-velocity > res-velocity

initial-velocity.png: initial-velocity.gpl res-velocity
	$(GRAPH) initial-velocity.gpl
	
initial-altitude: initial-altitude.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

res-altitude: initial-altitude
	./initial-altitude > res-altitude

initial-altitude.png: initial-altitude.gpl res-altitude
	$(GRAPH) initial-altitude.gpl
	
clean : 
	rm -f *~
	rm -f *.o
	rm -f glider

veryclean : clean
	rm -f res1 glider.png
