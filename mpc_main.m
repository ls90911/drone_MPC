clear
clear global
clc
close all

pos_constrain = [1 0];
vel_constrain = [0.5 0];
acc_constrain = [1 0];
t0 = 0;


% [P] = coefficient_with_costrains(pos_constrain,vel_constrain,acc_constrain,t0,deltaT);
% test_polynomial(P,0,5);
[P_min,t_min,P_tan_phi_min] = minimize_time(pos_constrain,vel_constrain,acc_constrain,t0);

verify_controller(P_tan_phi_min,pos_constrain(1),vel_constrain(1),t0,t0+t_min);

plot_result(P_min,P_tan_phi_min,t0,t0+t_min);
temp = 1;