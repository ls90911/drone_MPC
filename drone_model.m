function [dx] = drone_model(states,inputs)

vx = states(3);
vy = states(4);
phi = inputs(1);
theta = inputs(2);

dx = [vx;vy];
dvx = [-9.8*tan(theta)-0.5*vx;9.8*tan(phi)-0.2*vy];

dx = [dx;dvx];
end