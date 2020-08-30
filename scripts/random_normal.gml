///random_normal()

var t, u;
do t = random(1); until(t);
do u = random(1); until(u);
return sqrt(-2*ln(t))*cos(2*pi*u);
