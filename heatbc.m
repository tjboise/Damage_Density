function [pl,ql,pr,qr] = heatbc(xl,ul,xr,ur,t)
pl = ul-1;
ql = 0;
pr = ur;
qr = exp(-0.05*t);
end