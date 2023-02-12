function [c,f,s] = heatpde(x,t,u,dudx)
c = 1;
f = 0;
s = -x/(2040+59*x)*u;
end
