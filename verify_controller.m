function [] = verify_controller(P_tan_phi,p0,v0,t0,tf)
dt = (tf-t0)/100;
states = zeros(99,2);
time = zeros(99,1);
states(1,:) = [p0,v0];
A = [0,1;0,-0.5];
B = [0,9.8]';
for i = 1:size(states)-1
    time(i) = t0+(i-1)*dt;
    dx = A*states(i,:)'+B*get_value_from_coefficient(P_tan_phi,time(i));
    states(i+1,:) = states(i,:) + dx'*dt;
end

figure(2)
subplot(2,1,1)
plot(time,states(:,1),'.');
ylabel('y[m]');
grid on;
subplot(2,1,2)
plot(time,states(:,2),'.');
ylabel('v_y[m/s]');
xlabel('time[s]');
grid on;


end