function [value] = get_value_from_coefficient(P,t)
value = 0;
for i = 1:length(P)
    value = value+P(i)*t^(i-1);
end
end