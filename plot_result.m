function plot_result(P,P_tan_phi,t0,tf)
i = 1;
for t = t0:(tf-t0)/100:tf
    pos(i) = get_value_from_coefficient(P,t);
    phi(i) = atan(get_value_from_coefficient(P_tan_phi,t));
    time(i) = t;
    i = i+1;
end



figure(1)
subplot(2,1,1)
plot(time,pos);
grid on
ylabel('y[m]')
subplot(2,1,2)
plot(time,phi/pi*180,'.');
ylabel('phi[deg]');
grid on
end


function [value] = get_value_from_coefficient(P,t)
value = 0;
for i = 1:length(P)
    value = value+P(i)*t^(i-1);
end
end