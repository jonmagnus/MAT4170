addpath("src");

d = 2;
tau = [-1,-1,-1,0,1,1,1]';
t = [-1,-1,-1,-.5,0,.5,1,1,1]';
c = [1,-2,2,-1]';
b = oslo(c, tau, t, d)

d = 1;
tau = [0,0,1,2,2]';
t = [0,0,.5,1,1.5,2,2]';
c = [1,-1,1]';
b = oslo(c, tau, t, d)
