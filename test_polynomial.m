function [] = test_polynomial(P,t0,tf)
% P = fliplr(P');

% pos = polyval(P,t0);
% str =sprintf("position at t0 %f = %f\n",t0,pos);
% disp(str);
% pos = polyval(P,tf);
% str =sprintf("position at tf %f = %f\n",tf,pos);
% disp(str);
% dP = polyder(P);
% vel = polyval(dP,t0);
% str = sprintf("velocity at t0 %f = %f\n",t0,vel);
% disp(str);
% vel = polyval(dP,tf);
% str =sprintf("velocity at tf %f = %f\n",tf,vel);
% disp(str);
% ddP = polyder(dP);
% acc = polyval(ddP,t0);
% str =sprintf("acceleration at t0 %f = %f\n",t0,acc);
% disp(str);
% acc = polyval(ddP,tf);
% str =sprintf("acceleration at tf %f = %f\n",tf,acc);
% disp(str);



dP = [P(2) 2*P(3) 3*P(4) 4*P(5) 5*P(6)];
ddP = [2*P(3) 6*P(4) 12*P(5) 20*P(6)];

% calculate pos at t0 and tf

p0 = get_value_from_coefficient(P,t0);
pf = get_value_from_coefficient(P,tf);
fprintf("p0 = %f, pf = %f\n",p0,pf);

v0 = get_value_from_coefficient(dP,t0);
vf = get_value_from_coefficient(dP,tf);
fprintf("v0 = %f, vf = %f\n",v0,vf);

a0 = get_value_from_coefficient(ddP,t0);
af = get_value_from_coefficient(ddP,tf);
fprintf("a0 = %f, af = %f\n",a0,af);
end