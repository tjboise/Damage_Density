
x = linspace(0,200,70);
t = linspace(0,200,70);

tic
m = 0;
sol = pdepe(m,@heatpde,@heatic,@heatbc,x,t);
toc
disp(['运行时间: ',num2str(toc)]);