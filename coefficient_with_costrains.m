function [P] = coefficient_with_costrains(pos_constrain,vel_constrain,acc_constrains,t0,deltaT)

tf = t0 + deltaT;
% n is the order of the polynomial, it should be 1 less than the number of
% constrains
%n = length(pos_constrain)+length(vel_constrain)+length(acc_constrain)-1;

A = [t0^0   t0^1   t0^2   t0^3   t0^4   t0^5;...
      tf^0      tf^1 tf^2 tf^3 tf^4 tf^5;...
      0 t0^0 2*t0^1 3*t0^2 4*t0^3 5*t0^4;...
      0 tf^0 2*tf^1 3*tf^2 4*tf^3 5*tf^4;...
      0 0 2*t0^0 6*t0^1 12*t0^2 20*t0^3;...
       0 0 2*tf^0 6*tf^1 12*tf^2 20*tf^3];
   
b = [pos_constrain(1) pos_constrain(2)  vel_constrain(1)...
    vel_constrain(2) acc_constrains(1) acc_constrains(2)]';

P = inv(A)*b;


end