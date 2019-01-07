clear
clear global
clc
close all

pos_constrain = [1.62 0];
vel_constrain = [-0.34 0];
acc_constrain = [-0.41 0];
t0 = 0;
deltaT = 3;

 %[P] = coefficient_with_costrains(pos_constrain,vel_constrain,acc_constrain,t0,deltaT)
% [p_vel,p_acc,p_tan_phi] = test_polynomial(P,0,3)

[P_min,t_min,P_tan_phi_min] = minimize_time(pos_constrain,vel_constrain,acc_constrain,t0);

verify_controller(P_tan_phi_min,pos_constrain(1),vel_constrain(1),t0,t0+t_min);

plot_result(P_min,P_tan_phi_min,t0,t0+t_min);
temp = 1;