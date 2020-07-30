%%Q7-ÌÝ¶ÈÏÂ½µ
u0 = 0;
v0 = 0;
lin = 0.01;

for i = 1:5
    u1 = u0 - lin * (exp(u0) + exp(u0*v0)*v0 + 2*u0 -2*v0 -3);
    v1 = v0 - lin * (exp(2*v0)*2 + exp(u0*v0)*u0 -2*u0 +4*v0 -2);
    u0 = u1;
    v0 = v1;
end

E5 = exp(u0) + exp(2*v0) +exp(u0*v0) + power(u0,2) -2*u0*v0 +2*power(v0,2) - 3*u0 -2*v0;
fprintf('u0=%f\n',u0);
fprintf('v0=%f\n',v0);
fprintf('E5=%f\n',E5);

%%Q10-Å£¶Ù·¨
X0 = zeros(2,1);
for i=1:5
    u0 = X0(1,1);
    v0 = X0(2,1);
    H = [exp(u0)+exp(u0*v0)*power(v0,2)+2,exp(u0*v0)*(1+u0*v0)-2;exp(u0*v0)*(1+u0*v0)-2,exp(2*v0)*4+exp(u0*v0)*power(u0,2)];
    
    X1 = X0 - H\[(exp(u0) + exp(u0*v0)*v0 + 2*u0 -2*v0 -3);(exp(2*v0)*2 + exp(u0*v0)*u0 -2*u0 +4*v0 -2)];
    X0 = X1;
end

u0 = X0(1,1);
v0 = X0(2,1);
E5 = exp(u0) + exp(2*v0) +exp(u0*v0) + power(u0,2) -2*u0*v0 +2*power(v0,2) - 3*u0 -2*v0;
fprintf('u0=%f\n',u0);
fprintf('v0=%f\n',v0);
fprintf('E5=%f\n',E5);

