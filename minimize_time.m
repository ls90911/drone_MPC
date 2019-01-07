function [P_min,P_vel_min,P_tan_phi_min,t_min] = minimize_time(pos_constrain,vel_constrain,acc_constrains,t0)
deltaT = 3.0;
P_min = -1;
P_tan_phi_min = -1;
t_min = -1;
while(1)
    deltaT = deltaT - 0.1;
    P = coefficient_with_costrains(pos_constrain,vel_constrain,acc_constrains,t0,deltaT);
    [dP,ddP,P_tan_phi] = get_coefficient_from_P(P);
    if is_saturated(P_tan_phi,t0,t0+deltaT)
        break;
    end
    P_min = P;
    P_vel_min = dP;
    t_min = deltaT;
    P_tan_phi_min = P_tan_phi;
end

end

function flag_saturated = is_saturated(P_tan_phi,t0,tf)
flag_saturated = 0;
for t = t0:(tf-t0)/10:tf
    if abs(atan(get_value_from_coefficient(P_tan_phi,t))) > 30/180*pi
        flag_saturated = 1;
        break;
    end
end
end


function [dP,ddP,P_tan_phi] = get_coefficient_from_P(P)
dP = [P(2) 2*P(3) 3*P(4) 4*P(5) 5*P(6) 0]; % velocity
ddP = [2*P(3) 6*P(4) 12*P(5) 20*P(6) 0 0]; % acceleration
P_tan_phi = (ddP+ 0.5*dP)/9.8;
end