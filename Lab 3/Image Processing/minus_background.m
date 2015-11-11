function [C] = minus_background(B,D)
%% Minus the background and the depth image
%TODO make table noise dynamic
C = B - D;
sz = size(C);
for i=1:sz(1)
    for j=1:sz(2)
        if C(i,j) < 7 
            C(i,j) = 0;
        else 
            C(i,j) = inf;
        end
    end
end
end